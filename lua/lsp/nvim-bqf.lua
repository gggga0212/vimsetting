local fn = vim.fn

function _G.qftf(info)
    local items
    local ret = {}
    if info.quickfix == 1 then
        items = fn.getqflist({id = info.id, items = 0}).items
    else
        items = fn.getloclist(info.winid, {id = info.id, items = 0}).items
    end
    local limit = 31
    local fnameFmt1, fnameFmt2 = '%-' .. limit .. 's', '…%.' .. (limit - 1) .. 's'
    local validFmt = '%s │%5d:%-3d│%s %s'
    for i = info.start_idx, info.end_idx do
        local e = items[i]
        local fname = ''
        local str
        if e.valid == 1 then
            if e.bufnr > 0 then
                fname = fn.bufname(e.bufnr)
                if fname == '' then
                    fname = '[No Name]'
                else
                    fname = fname:gsub('^' .. vim.env.HOME, '~')
                end
                -- char in fname may occur more than 1 width, ignore this issue in order to keep performance
                if #fname <= limit then
                    fname = fnameFmt1:format(fname)
                else
                    fname = fnameFmt2:format(fname:sub(1 - limit))
                end
            end
            local lnum = e.lnum > 99999 and -1 or e.lnum
            local col = e.col > 999 and -1 or e.col
            local qtype = e.type == '' and '' or ' ' .. e.type:sub(1, 1):upper()
            str = validFmt:format(fname, lnum, col, qtype, e.text)
        else
            str = e.text
        end
        table.insert(ret, str)
    end
    return ret
end

vim.o.qftf = '{info -> v:lua._G.qftf(info)}'

-- Adapt fzf's delimiter in nvim-bqf
require('bqf').setup({
        auto_enable = {
        description = [[enable nvim-bqf in quickfix window automatically]],
        default = true
    },
    magic_window = {
        description = [[give the window magic, when the window is splited horizontally, keep
            the distance between the current line and the top/bottom border of neovim unchanged.
            It's a bit like a floating window, but the window is indeed a normal window, without
            any floating attributes.]],
        default = true
    },
    auto_resize_height = {
        description = [[resize quickfix window height automatically.
            Shrink higher height to size of list in quickfix window, otherwise extend height
            to size of list or to default height (10)]],
        default = false
    },
    preview = {
        auto_preview = {
            description = [[enable preview in quickfix window automatically]],
            default = true
        },
        border_chars = {
            description = [[border and scroll bar chars, they respectively represent:
                vline, vline, hline, hline, ulcorner, urcorner, blcorner, brcorner, sbar]],
            default = {'│', '│', '─', '─', '╭', '╮', '╰', '╯', '█'}
        },
        delay_syntax = {
            description = [[delay time, to do syntax for previewed buffer, unit is millisecond]],
            default = 50
        },
        win_height = {
            description = [[the height of preview window for horizontal layout,
                large value (like 999) perform preview window as a "full" mode]],
            default = 15
        },
        win_vheight = {
            description = [[the height of preview window for vertical layout]],
            default = 15
        },
        wrap = {
            description = [[wrap the line, `:h wrap` for detail]],
            default = false
        },
        should_preview_cb = {
            description = [[a callback function to decide whether to preview while switching buffer,
                with (bufnr: number, qwinid: number) parameters]],
            default = nil
        }
    },
    func_map = {
        description = [[the table for {function = key}]],
        default = [[see ###Function table for detail]],
    },
    filter = {
        fzf = {
            action_for = {
                ['ctrl-t'] = {
                    description = [[press ctrl-t to open up the item in a new tab]],
                    default = 'tabedit'
                },
                ['ctrl-v'] = {
                    description = [[press ctrl-v to open up the item in a new vertical split]],
                    default = 'vsplit'
                },
                ['ctrl-x'] = {
                    description = [[press ctrl-x to open up the item in a new horizontal split]],
                    default = 'split'
                },
                ['ctrl-q'] = {
                    description = [[press ctrl-q to toggle sign for the selected items]],
                    default = 'signtoggle'
                },
                ['ctrl-c'] = {
                    description = [[press ctrl-c to close quickfix window and abort fzf]],
                    default = 'closeall'
                }
            },
            extra_opts = {
                description = 'extra options for fzf',
                default = {'--bind', 'ctrl-o:toggle-all'}
            }
        }
    }
})
