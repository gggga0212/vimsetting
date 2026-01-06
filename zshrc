# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
#ZSH_THEME="robbyrussell"
#ZSH_THEME="fino"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-z
    zsh-completions
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-history-substring-search
    )

bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey ',' autosuggest-accept
source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias tnew='tmux -f ~/.tmux.conf new-session \; split-window -h \; split-window -v \; attach'
alias saveconfig='cp ~/.zshrc ~/.config/nvim/zshrc; 
                  cp ~/.gitconfig ~/.config/nvim/gitconfig;
                  cp ~/.tmux.conf ~/.config/nvim/tmux.conf;
                  echo "save zsh, gitconfig, tmux to linux"'
alias loadconfig='cp ~/.config/nvim/zshrc ~/.zshrc; 
                  cp ~/.config/nvim/gitconfig ~/.gitconfig;
                  cp ~/.config/nvim/tmux.conf ~/.tmux.conf;
                  cp ~/.config/nvim/lz_config.yml ~/.config/lazygit/config.yml;
                  source ~/.zshrc;
                  echo "load zsh, gitconfig, tmux to linux"'
alias nv='~/.config/nvim-linux-x86_64/bin/nvim'
alias nu='git crlf false;nv --headless "+Lazy! sync" +qa;nv'
alias nvig='nv .gitignore'
alias loadigsp='cp ~/.config/nvim/gitignoreSample .gitignore'
alias rl='rm -rf .git/*.lock;
rm -rf ../../.git/*.lock;'
alias doxy='cmd.exe /c "sdk_library_release.bat"'
alias ag="python ~/.config/nvim/autom.py"
alias wttr='curl http://wttr.in'
alias lz='cp ~/.config/nvim/lz_config.yml ~/.config/lazygit/config.yml;
rm -rf lazygit;
cp -r ~/.config/lazygit .;
lazygit'
alias yz='cp ~/.config/nvim/ydiff_config.yml ~/.config/lazygit/config.yml;lazygit'
alias rmc="~/.config/nvim/rvCmd.sh"
alias mixh="~/.config/nvim/mixh.sh"
alias cm="cmd.exe /c lazygit"
alias cmd="cmd.exe"
alias rmtag="git tag | xargs git tag -d"
alias bf='cd ~/AST2600_qemu/openbmc;. setup ast2600-default as26_build;bitbake obmc-phosphor-image --runall=fetch'
alias bk='cd ~/AST2600_qemu/openbmc;. setup ast2600-default as26_build;bitbake obmc-phosphor-image'
alias runbmc26="cp ./tmp/deploy/images/ast2600-default/obmc-phosphor-image-ast2600-default.static.mtd ./ast2600.static.mtd;
cd ~/AST2600_qemu/openbmc/as26_build;
./qemu-system-arm -m 1024 -M ast2600-evb -nographic -drive file=./ast2600.static.mtd,format=raw,if=mtd -net nic -net user,hostfwd=::3333-:22,hostfwd=::2443-:443,hostfwd=udp::2623-:623,hostname=qemu"
alias kq26='pkill qemu-system-arm'
alias kq27='pkill -9 qemu-system-aar'
alias bz="~/.config/nvim/openbmc/setup_openbmc.sh"

function s4() {
    # 左右分
    tmux split-window -h
    # 右半部上下分
    tmux split-window -v
    # 回到左半部 (索引 0)
    tmux select-pane -t 0
    # 左半部上下分
    tmux split-window -v
    # 重新排列成整齊的網格
    tmux select-layout tiled
    # 最後回到左上角的第一格
    tmux select-pane -t 0
}
function runbmc27() {
cd ~/AST2700_qemu/openbmc/as27_build/tmp/deploy/images/
IMGDIR=ast2700-default
UBOOT_SIZE=$(stat --format=%s -L ${IMGDIR}/u-boot-nodtb.bin)
qemu-system-aarch64 -M ast2700fc \
  -device loader,force-raw=on,addr=0x400000000,file=${IMGDIR}/u-boot-nodtb.bin \
  -device loader,force-raw=on,addr=$((0x400000000 + ${UBOOT_SIZE})),file=${IMGDIR}/u-boot.dtb \
  -device loader,force-raw=on,addr=0x430000000,file=${IMGDIR}/bl31.bin \
  -device loader,force-raw=on,addr=0x430080000,file=${IMGDIR}/optee/tee-raw.bin \
  -device loader,cpu-num=0,addr=0x430000000 \
  -device loader,cpu-num=1,addr=0x430000000 \
  -device loader,cpu-num=2,addr=0x430000000 \
  -device loader,cpu-num=3,addr=0x430000000 \
  -drive file=${IMGDIR}/image-bmc,if=mtd,format=raw \
  -device loader,file=${IMGDIR}/zephyr-aspeed-ssp.elf,cpu-num=4 \
  -device loader,file=${IMGDIR}/zephyr-aspeed-tsp.elf,cpu-num=5 \
  -serial pty -serial pty -serial pty \
  -net nic \
  -net user,hostfwd=tcp:127.0.0.1:5355-:5355,hostfwd=:127.0.0.1:2022-:22,hostfwd=:127.0.0.1:2443-:443,hostfwd=tcp:127.0.0.1:2080-:80,hostfwd=tcp:127.0.0.1:2200-:2200,hostfwd=udp:127.0.0.1:2623-:623,hostfwd=udp:127.0.0.1:2664-:664,hostname=qemu \
  -snapshot \
  -S -nographic

}
# 自定義 tio function
tiof() {
  # 檢查第一個參數是否為純數字
  if [[ "$1" =~ ^[0-9]+$ ]]; then
    # 如果是數字，將其轉換為 /dev/pts/n，並保留後續其他參數
    local pts_dev="/dev/pts/$1"
    shift # 移除第一個參數 (原本的數字)
    command tio "$pts_dev" "$@"
  else
    # 如果不是數字（例如帶有路徑或參數），則按原樣執行
    command tio "$@"
  fi
}
export LS_COLORS="di=01;36"
alias ls='ls --color=auto'

setopt no_nomatch
# To customize promptconfig/nvim/~/, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
# [ -f ~/.bashrc ] && . ~/.bashrc
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
