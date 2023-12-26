# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# if [ "$TMUX" = "" ]; then tmux; fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/jalmazan/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
#ZSH_THEME="robbyrussell"
ZSH_THEME="powerlevel10k/powerlevel10k"


# ZSH_THEME="spaceship"
# SPACESHIP_PROMPT_ADD_NEWLINE="true"
# SPACESHIP_CHAR_SYMBOL="\uf0e7"
# SPACESHIP_CHAR_PREFIX="\uf296"
# SPACESHIP_CHAR_SUFFIX=(" ")
# SPACESHIP_CHAR_COLOR_SUCCESS="yellow"
# SPACESHIP_PROMPT_DEFAULT_PREFIX="$USER"
# SPACESHIP_PROMPT_FIRST_PREFIX_SHOW="true"
# SPACESHIP_USER_SHOW="true"


# Which plugins would you like to load?
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
    git
    zsh-syntax-highlighting
    aliases
    tmux
    python
)


source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
  export EDITOR='vim'
else
  export EDITOR='vim'
fi

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
#
# Aliases and functions
alias ssh="TERM=xterm-256color ssh"
alias tmux="TERM=xterm-256color tmux"

alias lla="ll -a"
alias llt="ll -t"
alias llz='ll -S' # sort by decreasing size
alias mkdir='mkdir -pv'
alias rm='rm -I --preserve-root'
alias wget='wget -c'
alias df='df -H'
alias du='du -cH'
alias cdw='cd ~/workspace'
alias cds='cd ~/workspace/SAMFi'
alias cdd='cd ..'
# alias python='python3'
alias py='python3'
alias ipy='ipython'
# alias pip='pip3'
alias vim='nvim'
alias nvim='~/lib/nvim.appimage'

alias gpus='python /home/jalmazan/workspace/utils/gpustat.py'
alias cpus='python /home/jalmazan/workspace/utils/cpustat.py'
alias g='gpus'
alias q='squeue -u $USER -S "P,-t,+i" -o "%.10i %.9P %.2t %.180j %.15M %.15L %.6D %R"'
alias sq='squeue -S "P,-t,+i" -o "%.10i %.9P %.2t %.15j %.15M %.15L %.6D %R"'
alias sdrain='sinfo -R'
alias sqos='sacctmgr show qos'
alias swait='squeue  -t PD --format="%.3t %.14i %.15p %.16V %.12L %.10P %.10a %.10u %.20j %.12N %.20b %.20f %.20r %.2C %.8m"'
alias gputop='nvidia-smi -l -lms 1000'

# PATHS
# export PATH=$PATH:/usr/local/bin:/usr/bin:/usr/sbin
# export PATH=$PATH:/home/jalmazan/.local/bin
# export PATH=$PATH:/usr/local/cuda/bin
# export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
# export LD_RUN_PATH=$LD_RUN_PATH:/usr/local/cuda/lib64
# export PATH=$PATH:/home/jalmazan/utils
export PYTHONPATH=$PYTHONPATH:/home/jalmazan/workspace/breeze
# export PATH_TO_PROTOC=/home/jalmazan/workspace/pythonlib/protoc
export LC_CTYPE=en_US.UTF-8
export LC_ALL=en_US.UTF-8

#source /etc/proxyrc

# export DB_ROOT=/home/jalmazan/workspace/deep-image-retrieval/dirtorch/data/datasets
# export DB_ROOT=/home/jalmazan/.darwin/datasets
export DARWIN_ROOT=/home/jalmazan/.darwin/datasets

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000
setopt appendhistory autocd
# bindkey -v
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
# zstyle :compinstall filename '/Users/jon/.zshrc'
#
# autoload -Uz compinit
# compinit
# End of lines added by compinstall
#

# Basic auto/tab complete:
# autoload -U compinit
# zstyle ':completion:*' menu select
# zmodload zsh/complist
# compinit
# _comp_options+=(globdots)     # Include hidden files.
#
# # vi mode
# bindkey -v
# export KEYTIMEOUT=1
#
# # Use vim keys in tab complete menu:
# bindkey -M menuselect 'h' vi-backward-char
# bindkey -M menuselect 'k' vi-up-line-or-history
# bindkey -M menuselect 'l' vi-forward-char
# bindkey -M menuselect 'j' vi-down-line-or-history
# bindkey -v '^?' backward-delete-char


# PURE
# fpath+=("$HOME/.zsh/pure")
# autoload -U promptinit; promptinit
# zstyle :prompt:pure:path color 039
# zstyle :prompt:pure:prompt:success color 213
# prompt pure

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# source ~/.purepower
[[ -f ~/.p10k.zsh ]] && source ~/.p10k.zsh

stn () {
    ssh $1 -t "tmux -CC new -s $2";
}
sta () {
    ssh $1 -t "tmux -CC attach -t $2"
}
deploy_local () {
    mkdir -p $DB_LOCAL
    tar xf $1 -C $DB_LOCAL
}
stdout () {
    find /tmp-network/user/jalmazan/jobs -maxdepth 1 -name "*$1.stdout" -print -exec cat {} +
}
stderr () {
    find /tmp-network/user/jalmazan/jobs -maxdepth 1 -name "*$1.stderr" -print -exec cat {} +
}
szh () {
    ssh -t jalmazan@$1 '~/miniconda3/bin/zsh -l'
}

function nvw
{
    for p in `nvidia-smi | grep MiB | grep "^|  " | sed -e 's@ \+@ @g' | cut -d' ' -f3`; do \
        s=`stat -c %y /proc/${p} | cut -d. -f1`;\
        c="\033[0;$(((${p} % 7) + 31))m"; \
        printf ${c}; \
        echo -n "`ps -eo pid,user | grep "^ *$p " | grep -v grep | sed -e 's@ \+@ @g'` "  ; \
        echo -n "${s} ";\
        ps -eo pid,cmd | grep "^ *$p " | grep -v grep | sed -e 's@ \+@ @g'  -e 's@^ *@@g' | cut -d' ' -f2-  ; \
        printf '\033[0m';\
    done;
}

function henv
{

    usage='henv [env_name (use "none" to deactivate, default: $(whoami))]'
  
    # show help message if first argument is -h or --help
    if [ "$1" = "-h" -o "$1" = "--help" ]; then echo $usage; return 0; fi

    export CONDARC="${HOME}/.condarc_humans"
    export CONDA_DIR=/nfs/tools/humans/conda #/nfs/project/humans/conda
    export CONDA_PKGS_DIRS=$CONDA_DIR/pkgs/$USER

    # parse environment name
    env_name=$1
    shift
    if [ "$env_name" = "" ]; then env_name=$(whoami); fi


    # re-establish config origin before switching
    #if [ "$CONDA_DEFAULT_ENV" != "" ]; then conda $CONDA_DIR/bin/deactivate; fi
    export PATH=$ORIG_PATH
    export PYTHONPATH=$ORIG_PYTHONPATH
    export LD_LIBRARY_PATH=$ORIG_LD_LIBRARY_PATH
    export PKG_CONFIG_PATH=$ORIG_PKG_CONFIG_PATH

    # activate the conda env
# source $CONDA_DIR/bin/activate $env_name  # commented out by conda initialize  # commented out by conda initialize
  
    # update LD_LIBRARY_PATH
    export LD_LIBRARY_PATH=$CONDA_DIR/envs/$env_name/lib/:$LD_LIBRARY_PATH

    # add cuda if available 
    if [ -d /usr/local/cuda ]; then
        export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/cuda/lib64
        export LD_RUN_PATH=$LD_RUN_PATH:/usr/local/cuda/lib64
        export PATH=$PATH:/usr/local/cuda/bin
    fi
}

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/home/jalmazan/miniconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/home/jalmazan/miniconda3/etc/profile.d/conda.sh" ]; then
# . "/home/jalmazan/miniconda3/etc/profile.d/conda.sh"  # commented out by conda initialize
    else
# export PATH="/home/jalmazan/miniconda3/bin:$PATH"  # commented out by conda initialize
    fi
fi
unset __conda_setup

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
