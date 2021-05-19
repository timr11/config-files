# If you come from bash you might have to change your $PATH.
export PATH=$HOME/bin:/usr/local/bin:/usr/bin:/bin:/sbin:$HOME/.local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="bira"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in ~/.oh-my-zsh/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
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
# Standard plugins can be found in ~/.oh-my-zsh/plugins/*
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  vi-mode
)

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
#

export TIMS_CONFIG_FILES="/home/config-files"
export LINUX_CONFIG_FILES="$TIMS_CONFIG_FILES/linux-files"
export LINUX_SCRIPTS_DIR="$LINUX_CONFIG_FILES/scripts"
export LINUX_SETUP_SCRIPTS_DIR="$LINUX_SCRIPTS_DIR/setup"
export BLACKCAT="/blackcat"
export CURRENT_TERM="term-5a"
export AM_GH="$BLACKCAT/github/project-airmatrix"

ssh-add ~/.ssh/id_rsa &> /dev/null
ssh-add ~/.ssh/airmatrix_rsa &> /dev/null

alias g++14="g++ -std=c++14 -Wall -g"
alias briss='setsid java -jar ~/Downloads/Programs/briss-0.9/briss-0.9.jar'
alias cds="cd $BLACKCAT/school-folder/$CURRENT_TERM/"
alias lsh='ls -alh'
alias lsa='ls -lh'
alias lsaa='ls -alh'
alias mupdf='setsid mupdf > /dev/null 2>&1'
alias evince='setsid evince'
alias evc='expressvpn connect'
alias evd='expressvpn disconnect'
alias python='/usr/bin/python'
alias purgear='sudo apt-get purge --auto-remove'
alias sssh='ssh tromansk@linux.student.cs.uwaterloo.ca'
alias simple-scan='setsid simple-scan > /dev/null 2>&1'
alias topdirs='sudo du -h --max-depth=1 | sort -hr | head'
alias updatestatics="$LINUX_SETUP_SCRIPTS_DIR/setup_statics.sh"
alias editzrc="vim $LINUX_CONFIG_FILES/static/.zshrc"
alias editvim="vim $TIMS_CONFIG_FILES/static/vim/vimrc.vim"
alias editi3="vim $LINUX_CONFIG_FILES/static/i3/config"
alias zrc="source $HOME/.zshrc"

function lowtemp {
    setsid redshift -b "$1:$1" -P -O 4500K > /dev/null 2>&1
}

function pushecr {
  docker build --network=host -t "$1" .
  docker tag "$1" ${ECR_URL}/"$1"
  docker push ${ECR_URL}/"$1"
}

alias am="cd $AM_GH"
alias ams="cd $AM_GH/airmatrix-server"
alias amwao="cd $AM_GH/webapp-operator"
alias amwat="cd $AM_GH/webapp-traffic-manager"
alias amdr="cd $AM_GH/drone-communications-service"
alias amrs="cd $AM_GH/airmatrix-routing-server > /dev/null 2>&1 || cd $AM_GH/routing-service-2"
alias amdoc="cd $BLACKCAT/documents/airmatrix-docs"
alias ammysql="mysql -h $RES_DB_URL -P 3306 -u master -p"
#alias amtest="$HOME/Documents/SDKs/Firmware/setLat_Lng.sh 43.6582262 -79.3982735"
alias amtest="$HOME/Documents/SDKs/Firmware/setLat_Lng.sh 43.6583 -79.3983"
alias amxrd="cd $AM_GH/xrd-proxy"
alias aws-docker-auth="aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin 904593771304.dkr.ecr.us-east-2.amazonaws.com"
alias aws-psql="psql -d airmatrix -U airmatrix -h airmatrix-db-pg.c6jlhcc2njk8.us-east-2.rds.amazonaws.com"

alias aws-dcs="ssh -A ec2-user@ec2-18-189-145-225.us-east-2.compute.amazonaws.com"
alias aws-bastion="ssh -A ubuntu@ec2-18-222-113-3.us-east-2.compute.amazonaws.com"
alias aws-k8s-master="ssh -A admin@ec2-18-188-215-240.us-east-2.compute.amazonaws.com"
alias aws-jenkins="ssh -A ubuntu@ec2-18-217-219-70.us-east-2.compute.amazonaws.com"

export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
export PATH=$HOME/sys161/bin:$HOME/sys161/tools/bin:$PATH
export PATH=$PATH:$HOME/anaconda3/bin
export PATH=$PATH:$JAVA_HOME/bin
export PATH=$PATH:$HOME/Downloads/programs/apache-maven-3.6.3/bin
export PATH=$PATH:$LINUX_SCRIPTS_DIR
export PATH=$PATH:/home/linuxbrew/.linuxbrew/bin
export CROSS_COMPILE=$HOME/Downloads/programs/gcc-linaro-7.5.0-2019.12-i686_aarch64-linux-gnu/bin/aarch64-linux-gnu-
# export CROSS_COMPILE=/home/timr11/Downloads/programs/gcc-arm-9.2-2019.12-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-

alias linuxconfig="cd $LINUX_CONFIG_FILES"

alias sshdatasci="ssh -D 1080 tromansk@datasci.cs.uwaterloo.ca"

