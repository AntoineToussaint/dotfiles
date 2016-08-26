source ~/.antigen/antigen/antigen.zsh

# Load the oh-my-zsh's library.
antigen use oh-my-zsh

# Bundles from the default repo (robbyrussell's oh-my-zsh).
antigen bundle git
antigen bundle pip
antigen bundle command-not-found
antigen bundle brew
antigen bundle osx
antigen bundle history
antigen bundle docker
antigen bundle docker-compose

antigen bundle zsh-users/zsh-syntax-highlighting

# Load the theme.
antigen theme robbyrussell

# Tell antigen that you're done.
antigen apply

# For z
. `brew --prefix`/etc/profile.d/z.sh



### VI binding
bindkey -v
# Fast Esc mode
bindkey jj vi-cmd-mode
bindkey kk vi-cmd-mode
export VISUAL=mvim
export EDITOR="$VISUAL"

### powerline
. /Library/Python/2.7/site-packages/powerline/bindings/zsh/powerline.zsh

alias v="mvim"
alias c="clear"

alias cd="pushd > /dev/null"
alias bd="popd > /dev/null"

alias py="python"

# utils
source $HOME/.zsh/utils

# DOCKER Helpers

latest_docker_image() {
   IMAGE_ID=`docker images | sed -n 2p | awk '{print $3}'`
   echo $IMAGE_ID
}


#export KEYTIMEOUT=1
bindkey -M viins 'jj’ vi-cmd-mode
bindkey -M viins 'kk’ vi-cmd-mode

# set up for insert mode too
bindkey -M viins '^R' history-incremental-pattern-search-backward
bindkey -M viins '^F' history-incremental-pattern-search-forward

bindkey -M viins '^[OA' history-beginning-search-backward
bindkey -M viins '^[OB' history-beginning-search-forward


# PYTHON

# added by Anaconda3 4.1.1 installer
export PATH="/Users/antoine/anaconda/bin:$PATH"

# added by Anaconda3 4.1.1 installer
export PATH="/Users/antoine/anaconda3/bin:$PATH"
#
#

# Virtual env
export WORKON_HOME=$HOME/.envs
export PROJECT_HOME=$HOME/Development
source /usr/local/bin/virtualenvwrapper.sh
#source $(brew --prefix autoenv)/activate.sh

# MISC SCRIPTS
SCRIPT_DIR="$HOME/Development/scripts"

# IMGCAT: display images in shell
IMGCAT="imgcat"
alias imgcat="$SCRIPT_DIR/$IMGCAT/imgcat.sh"
alias fuck="imgcat $SCRIPT_DIR/$IMGCAT/fuck.jpg"

