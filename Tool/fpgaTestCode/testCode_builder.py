"""
testCode Builder — Python/tkinter version
Replaces testCode_builder.ps1
"""

import json
import os
import re
import subprocess
import tkinter as tk
from tkinter import filedialog, messagebox, ttk
from collections import deque

# ─── Config persistence ───────────────────────────────────────────────────────
CONFIG_FILE = os.path.join(os.environ.get("APPDATA", os.path.expanduser("~")),
                           "testcode_builder.json")

def load_config():
    if os.path.exists(CONFIG_FILE):
        try:
            with open(CONFIG_FILE, encoding="utf-8") as f:
                return json.load(f)
        except Exception:
            pass
    return {"testCodePath": ""}

def save_config(cfg):
    with open(CONFIG_FILE, "w", encoding="utf-8") as f:
        json.dump(cfg, f, ensure_ascii=False, indent=2)

# ─── Path helpers ─────────────────────────────────────────────────────────────
def to_wsl_path(win_path: str) -> str:
    p = win_path.replace("\\", "/")
    # UNC path: //wsl.localhost/<distro>/... → /...
    if p.lower().startswith("//wsl.localhost/") or p.lower().startswith("//wsl$/"):
        prefix = "//wsl.localhost/" if p.lower().startswith("//wsl.localhost/") else "//wsl$/"
        rest = p[len(prefix):]
        # Strip the distro name (first path component)
        idx = rest.find("/")
        if idx != -1:
            return rest[idx:]
        return "/"
    if len(p) >= 2 and p[1] == ":":
        return "/mnt/" + p[0].lower() + p[2:]
    return p

def find_build_sh(root: str):
    """BFS: return Windows path of first build.sh found, or None."""
    queue = deque([root])
    while queue:
        d = queue.popleft()
        candidate = os.path.join(d, "build.sh")
        if os.path.isfile(candidate):
            return candidate
        try:
            for entry in sorted(os.scandir(d), key=lambda e: e.name):
                if entry.is_dir():
                    queue.append(entry.path)
        except PermissionError:
            pass
    return None

# ─── Syntax highlight rules (C language) ─────────────────────────────────────
HIGHLIGHT_RULES = [
    # Block comments  /* ... */
    ("comment",     r"/\*[\s\S]*?\*/"),
    # Line comments   // ...
    ("comment",     r"//[^\n]*"),
    # String literals  "..."
    ("string",      r'"(?:\\.|[^"\\])*"'),
    # Char literals  '.'
    ("string",      r"'(?:\\.|[^'\\])*'"),
    # Preprocessor  #include / #define / etc.
    ("preproc",     r"#\s*\w+"),
    # Keywords
    ("keyword",     r"\b(?:auto|break|case|char|const|continue|default|do|double|"
                    r"else|enum|extern|float|for|goto|if|inline|int|long|register|"
                    r"restrict|return|short|signed|sizeof|static|struct|switch|"
                    r"typedef|union|unsigned|void|volatile|while|"
                    r"uint8_t|uint16_t|uint32_t|uint64_t|"
                    r"int8_t|int16_t|int32_t|int64_t|size_t|bool|true|false|NULL)\b"),
    # Numbers  (hex / decimal / float)
    ("number",      r"\b0x[0-9A-Fa-f]+[UuLl]*\b|\b\d+\.?\d*(?:[eE][+-]?\d+)?[UuLlFf]*\b"),
    # Function calls  name(
    ("function",    r"\b([A-Za-z_]\w*)\s*(?=\()"),
]

TAG_COLORS = {
    "keyword":  "#569cd6",   # blue
    "preproc":  "#c586c0",   # purple
    "string":   "#ce9178",   # orange-brown
    "comment":  "#6a9955",   # green
    "number":   "#b5cea8",   # light green
    "function": "#dcdcaa",   # yellow
}

# ─── Main App ─────────────────────────────────────────────────────────────────
class App(tk.Tk):
    def __init__(self):
        super().__init__()
        self.title("testCode Builder")
        self.geometry("1100x720")
        self.minsize(800, 500)
        self.configure(bg="#1e1e1e")

        self.cfg = load_config()
        self.build_sh_win = None
        self.current_file = None
        self.is_dirty = False
        self._highlight_job = None

        self._build_ui()
        self._bind_shortcuts()

        if self.cfg.get("testCodePath") and os.path.isdir(self.cfg["testCodePath"]):
            self.txt_path.insert(0, self.cfg["testCodePath"])
            self._populate_tree(self.cfg["testCodePath"])
            self._resolve_build_sh(self.cfg["testCodePath"])

    # ── UI construction ───────────────────────────────────────────────────────
    def _build_ui(self):
        # ── Top bar ──────────────────────────────────────────────────────────
        top = tk.Frame(self, bg="#2d2d30", height=40)
        top.pack(side="top", fill="x")
        top.pack_propagate(False)

        tk.Label(top, text="testCode 資料夾:", bg="#2d2d30", fg="#c0c0c0",
                 font=("Segoe UI", 11)).pack(side="left", padx=(10, 4), pady=8)

        self.txt_path = tk.Entry(top, bg="#3c3c3c", fg="white",
                                 insertbackground="white", font=("Segoe UI", 11),
                                 relief="flat")
        self.txt_path.pack(side="left", fill="x", expand=True, pady=6)

        tk.Button(top, text="Browse", bg="#007acc", fg="white",
                  font=("Segoe UI", 10), relief="flat", padx=10,
                  command=self._browse).pack(side="left", padx=(6, 10), pady=6)

        # ── Bottom button bar ─────────────────────────────────────────────────
        bot = tk.Frame(self, bg="#2d2d30", height=42)
        bot.pack(side="bottom", fill="x")
        bot.pack_propagate(False)

        self.btn_build = tk.Button(
            bot, text="Build Selected", bg="#009650", fg="white",
            font=("Segoe UI", 12, "bold"), relief="flat", padx=12,
            command=self._build)
        self.btn_build.pack(side="left", padx=(10, 6), pady=6)

        self.btn_save = tk.Button(
            bot, text="Save  (Ctrl+S)", bg="#505050", fg="white",
            font=("Segoe UI", 11), relief="flat", padx=10,
            state="disabled", command=self._save_file)
        self.btn_save.pack(side="left", pady=6)

        # ── Status bar ────────────────────────────────────────────────────────
        self.status_var = tk.StringVar(value="Ready")
        status = tk.Label(self, textvariable=self.status_var,
                          bg="#007acc", fg="white",
                          font=("Segoe UI", 10), anchor="w", padx=8)
        status.pack(side="bottom", fill="x")
        self._status_bar = status

        # ── Paned window (TreeView | Editor) ─────────────────────────────────
        paned = tk.PanedWindow(self, orient="horizontal",
                               bg="#1e1e1e", sashwidth=5, sashrelief="flat")
        paned.pack(fill="both", expand=True)

        # Left: TreeView
        left = tk.Frame(paned, bg="#252526")
        paned.add(left, minsize=120, width=210)

        self.tree = ttk.Treeview(left, show="tree", selectmode="browse")
        self.tree.pack(fill="both", expand=True)

        style = ttk.Style()
        style.theme_use("default")
        style.configure("Treeview",
                        background="#252526", foreground="white",
                        fieldbackground="#252526", font=("Consolas", 13),
                        rowheight=26)
        style.map("Treeview", background=[("selected", "#094771")])

        self.tree.bind("<<TreeviewSelect>>", self._on_tree_select)
        self.tree.bind("<Double-1>", self._on_tree_double)

        # Right: Editor panel
        right = tk.Frame(paned, bg="#1e1e1e")
        paned.add(right, minsize=300)

        # Filename label
        self.lbl_filename = tk.Label(
            right, text="  (no file open)", bg="#2d2d30", fg="#c0c0c0",
            font=("Segoe UI", 11), anchor="w", height=1)
        self.lbl_filename.pack(fill="x")

        # Editor area: line numbers + text + scrollbars
        editor_outer = tk.Frame(right, bg="#1e1e1e")
        editor_outer.pack(fill="both", expand=True)

        # Horizontal scrollbar
        hsb = tk.Scrollbar(editor_outer, orient="horizontal")
        hsb.pack(side="bottom", fill="x")

        # Vertical scrollbar
        vsb = tk.Scrollbar(editor_outer, orient="vertical")
        vsb.pack(side="right", fill="y")

        # Line number gutter
        self.line_nums = tk.Text(
            editor_outer,
            width=5, padx=6,
            bg="#252526", fg="#858585",
            font=("Consolas", 13),
            relief="flat", state="disabled",
            cursor="arrow", takefocus=0)
        self.line_nums.pack(side="left", fill="y")

        # Separator between gutter and editor
        tk.Frame(editor_outer, bg="#3c3c3c", width=1).pack(side="left", fill="y")

        # Main editor
        self.editor = tk.Text(
            editor_outer,
            bg="#1e1e1e", fg="#dcdcdc",
            insertbackground="white",
            font=("Consolas", 13),
            relief="flat", wrap="none", undo=True,
            tabs=("2c",),
            selectbackground="#264f78",
            yscrollcommand=self._on_editor_yscroll,
            xscrollcommand=hsb.set)
        self.editor.pack(side="left", fill="both", expand=True)

        vsb.config(command=self._on_vsb_scroll)
        hsb.config(command=self.editor.xview)
        self._vsb = vsb

        # Configure syntax highlight tags
        for tag, color in TAG_COLORS.items():
            self.editor.tag_configure(tag, foreground=color)
        # comment tag: also italic
        self.editor.tag_configure("comment", foreground=TAG_COLORS["comment"],
                                  font=("Consolas", 13, "italic"))

        self.editor.bind("<<Modified>>", self._on_editor_modified)
        self.editor.bind("<KeyRelease>", self._schedule_highlight)
        self.editor.bind("<Configure>", lambda e: self._update_line_numbers())

    def _bind_shortcuts(self):
        self.editor.bind("<Control-s>", lambda e: (self._save_file(), "break")[1])
        self.bind("<Control-s>", lambda e: self._save_file())

    # ── Scrolling sync ────────────────────────────────────────────────────────
    def _on_editor_yscroll(self, first, last):
        self._vsb.set(first, last)
        self._sync_line_numbers_scroll()

    def _on_vsb_scroll(self, *args):
        self.editor.yview(*args)
        self._sync_line_numbers_scroll()

    def _sync_line_numbers_scroll(self):
        first = self.editor.yview()[0]
        self.line_nums.yview_moveto(first)

    # ── Line numbers ──────────────────────────────────────────────────────────
    def _update_line_numbers(self):
        total = int(self.editor.index("end-1c").split(".")[0])
        content = "\n".join(str(i) for i in range(1, total + 1))
        self.line_nums.config(state="normal")
        self.line_nums.delete("1.0", "end")
        self.line_nums.insert("1.0", content)
        self.line_nums.config(state="disabled")
        # Adjust gutter width to fit number of digits
        width = max(3, len(str(total))) + 1
        self.line_nums.config(width=width)
        self._sync_line_numbers_scroll()

    # ── Syntax highlighting ───────────────────────────────────────────────────
    def _schedule_highlight(self, _event=None):
        if self._highlight_job:
            self.after_cancel(self._highlight_job)
        self._highlight_job = self.after(120, self._apply_highlight)

    def _apply_highlight(self):
        # Remove all existing tags
        for tag in TAG_COLORS:
            self.editor.tag_remove(tag, "1.0", "end")

        text = self.editor.get("1.0", "end-1c")

        for tag, pattern in HIGHLIGHT_RULES:
            for m in re.finditer(pattern, text, re.MULTILINE):
                start = self._offset_to_index(text, m.start())
                end   = self._offset_to_index(text, m.end())
                self.editor.tag_add(tag, start, end)

        # Raise comment and string tags so they override keywords inside comments
        self.editor.tag_raise("comment")
        self.editor.tag_raise("string")

    @staticmethod
    def _offset_to_index(text: str, offset: int) -> str:
        """Convert a flat character offset to tkinter 'line.col' index."""
        line = text[:offset].count("\n") + 1
        col  = offset - text[:offset].rfind("\n") - 1
        return f"{line}.{col}"

    # ── Tree helpers ─────────────────────────────────────────────────────────
    def _populate_tree(self, root: str):
        self.tree.delete(*self.tree.get_children())
        root_id = self.tree.insert(
            "", "end",
            text="📁 " + os.path.basename(root.rstrip("/\\")),
            open=True, tags=("folder",))
        self.tree.tag_configure("folder", foreground="#d4b483")
        self._add_dir(root_id, root)

    def _add_dir(self, parent_id, dir_path: str):
        try:
            entries = sorted(os.scandir(dir_path),
                             key=lambda e: (not e.is_dir(), e.name.lower()))
        except PermissionError:
            return
        for entry in entries:
            if entry.is_dir():
                node = self.tree.insert(parent_id, "end",
                                        text="📁 " + entry.name,
                                        open=True, tags=("folder",))
                self._add_dir(node, entry.path)
            elif entry.name.endswith(".c"):
                self.tree.insert(parent_id, "end",
                                 text="📄 " + entry.name,
                                 values=(entry.path,), tags=("cfile",))
        self.tree.tag_configure("cfile", foreground="#87ceeb")

    def _selected_c_path(self):
        sel = self.tree.selection()
        if not sel:
            return None
        vals = self.tree.item(sel[0], "values")
        return vals[0] if vals else None

    # ── Tree events ──────────────────────────────────────────────────────────
    def _on_tree_select(self, _event):
        path = self._selected_c_path()
        if path:
            self._open_file(path)

    def _on_tree_double(self, _event):
        if self._selected_c_path():
            self._build()

    # ── Browse ───────────────────────────────────────────────────────────────
    def _browse(self):
        initial = self.txt_path.get()
        d = filedialog.askdirectory(
            title="選擇 testCode 資料夾",
            initialdir=initial if os.path.isdir(initial) else None)
        if d:
            self.txt_path.delete(0, "end")
            self.txt_path.insert(0, d)
            self.cfg["testCodePath"] = d
            save_config(self.cfg)
            self._populate_tree(d)
            self._resolve_build_sh(d)

    def _resolve_build_sh(self, root: str):
        found = find_build_sh(root)
        self.build_sh_win = found
        if found:
            rel = os.path.relpath(found, root)
            self._set_status(f"build.sh found: {rel}", "#007acc")
        else:
            self._set_status("WARNING: build.sh not found in tree", "#a05000")

    # ── Editor ───────────────────────────────────────────────────────────────
    def _open_file(self, win_path: str):
        if self.is_dirty:
            name = os.path.basename(self.current_file or "")
            ans = messagebox.askyesnocancel(
                "Unsaved Changes", f"{name} 尚未儲存，是否先儲存？")
            if ans is None:
                return
            if ans:
                self._save_file()

        try:
            with open(win_path, encoding="utf-8") as f:
                content = f.read()
        except Exception as e:
            messagebox.showerror("Open Error", str(e))
            return

        self.current_file = win_path
        self.editor.delete("1.0", "end")
        self.editor.insert("1.0", content)
        self.editor.edit_modified(False)
        self._set_dirty(False)
        self._update_line_numbers()
        self._apply_highlight()
        self._set_status(f"Opened: {os.path.basename(win_path)}", "#007acc")

    def _on_editor_modified(self, _event):
        if self.editor.edit_modified():
            self._set_dirty(True)
            self.editor.edit_modified(False)
            self._update_line_numbers()

    def _set_dirty(self, dirty: bool):
        self.is_dirty = dirty
        self.btn_save.config(state="normal" if dirty else "disabled")
        if self.current_file:
            name = os.path.basename(self.current_file)
            label = f"  {name}  *" if dirty else f"  {name}"
            color = "#e0a000" if dirty else "#c0c0c0"
            self.lbl_filename.config(text=label, fg=color)

    def _save_file(self):
        if not self.current_file:
            return
        try:
            content = self.editor.get("1.0", "end-1c")
            with open(self.current_file, "w", encoding="utf-8") as f:
                f.write(content)
            self._set_dirty(False)
            self._set_status(f"Saved: {os.path.basename(self.current_file)}", "#007acc")
        except Exception as e:
            messagebox.showerror("Save Error", str(e))

    # ── Build ────────────────────────────────────────────────────────────────
    def _build(self):
        win_path = self._selected_c_path()
        if not win_path:
            messagebox.showwarning("No file selected", "請先在左側 Tree 選擇一個 .c 檔案。")
            return

        if not self.build_sh_win:
            messagebox.showerror("build.sh not found",
                                 "找不到 build.sh\n請確認 testCode 資料夾內有 build.sh")
            return

        if self.is_dirty:
            self._save_file()

        build_sh_dir = os.path.dirname(self.build_sh_win)
        rel_path     = os.path.relpath(win_path, build_sh_dir).replace("\\", "/")
        wsl_build_dir = to_wsl_path(build_sh_dir)

        bash_cmd = f"cd '{wsl_build_dir}' && chmod 777 build.sh && ./build.sh '{rel_path}'"
        subprocess.Popen(
            ["wsl.exe", "-d", "Ubuntu-24.04", "--", "bash", "-c",
             f"{bash_cmd}; echo; read -p 'Press Enter to close...'"],
            creationflags=subprocess.CREATE_NEW_CONSOLE)

        self._set_status(f"Launched: ./build.sh {rel_path}", "#007acc")

    # ── Status bar ───────────────────────────────────────────────────────────
    def _set_status(self, text: str, color: str = "#007acc"):
        self.status_var.set(text)
        self._status_bar.config(bg=color)


# ─── Entry point ──────────────────────────────────────────────────────────────
if __name__ == "__main__":
    app = App()
    app.mainloop()
