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
alias gt='cd ../ble_stack_lib/src/ble_stack'
alias gotodoxy='cd ../ble_stack_lib/ble_stack_lib.X/doxygen_script'
alias checkoutteam='cd ../ble_stack_lib/src/ble_stack;git checkout host_stack_team'
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
alias chrome="open -a 'Google Chrome'"
alias brave="open -a 'Brave Browser'"
# alias nv='~/.config/nvim/nvim-macos/bin/nvim'
alias nrm='rm -rf ~/.config/nvim-linux64 ~/.config/nvim-linux64.tar.gz'
alias ndl='wget https://github.com/neovim/neovim/releases/download/v0.9.5/nvim-linux64.tar.gz'
alias nup='tar xzvf nvim-linux64.tar.gz'
alias nv='~/.config/nvim-linux64/bin/nvim'
alias nvig='nv .gitignore'
alias loadigsp='cp ~/.config/nvim/gitignoreSample .gitignore'
alias rl='rm -rf ../.git/*.lock;
rm -rf ../../.git/*.lock;'
alias doxy='cmd.exe /c "sdk_library_release.bat"'
alias ar="rm -rf ../Testset_old.json"
alias ag="python ~/.config/nvim/autom.py"
alias wttr='curl http://wttr.in'
alias lz='cp ~/.config/nvim/lz_config.yml ~/.config/lazygit/config.yml;lazygit'
alias yz='cp ~/.config/nvim/ydiff_config.yml ~/.config/lazygit/config.yml;lazygit'
alias csc='cp ~/.config/nvim/lua/lsp/cscope_cscope.lua ~/.config/nvim/lua/lsp/cscope.lua;
cp ~/.config/nvim/lua/lsp/telescope_csc.lua ~/.config/nvim/lua/lsp/telescope.lua;
git crlf true;
                  echo "packer is changed to cscope."'
alias cst='cp ~/.config/nvim/lua/lsp/cscope_telescope.lua ~/.config/nvim/lua/lsp/cscope.lua;
cp ~/.config/nvim/lua/lsp/telescope_cst.lua ~/.config/nvim/lua/lsp/telescope.lua;
git crlf false;
                  echo "packer is changed to cscope."'
alias csf='cp ~/.config/nvim/lua/lsp/cscope_fzf.lua ~/.config/nvim/lua/lsp/cscope.lua;
                  echo "packer is changed to cscope."'
alias wbz6='
# Enable CRLF conversion
git crlf true
# Define directory variables
APP_DIR="/mnt/c/mchpCode/AppSample"
BZ6_REPO="https://bitbucket.microchip.com/scm/wsgsw/pic32cx-bz6_ble_apps.git"
BZ6_DIR="$APP_DIR/pic32cx-bz6_ble_apps"
WIRELESS_DIR="$APP_DIR/wireless_ble"
APPS_DIR="$WIRELESS_DIR/apps/pic32_cxbz6"
APPS=("ble_ancs_app" "ble_anpc_app" "ble_anps_app" "ble_pxpm_app" "ble_pxpr_app" "ble_hogps_app")

# Change to the working directory
cd $APP_DIR

# Remove old directories and clone new repositories
rm -rf $BZ6_DIR
git clone --recursive $BZ6_REPO

# Switch to the development branch in BZ6 repository
cd $BZ6_DIR
git checkout dev

# Ensure no lock file exists and update the wireless repository
cd $WIRELESS_DIR
rm -rf .git/index.lock
git rt
git checkout dev
git pull
# Create and switch to the new branch
git checkout -b BBUCKSW-254-sampleCodeBZ6Update
# Remove old application directories and copy new ones
for app in "${APPS[@]}"; do
    rm -rf $APPS_DIR/$app
    cp -r $BZ6_DIR/$app $APPS_DIR/$app
done

# Prompt the user to check and push changes
cd $WIRELESS_DIR
echo "Please check and push to the git"
'


setopt no_nomatch
# To customize promptconfig/nvim/~/, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
