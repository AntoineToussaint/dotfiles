#!/bin/sh
echo "Installing some nice things..."
# Determine how to install things
function os_type
{
  case `uname` in
    Linux )
      which yum && { INSTALLER="sudo yum install -y "; return; }
      which apt-get && { INSTALLER="sudo apt-get install"; return; }
      ;;
    Darwin )
      if ! [ -x "$(command -v brew)" ]; then
        echo 'Installing brew'
        /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
      else
        echo 'Brew is installed.'
      fi
      INSTALLER="brew install"
      ;;
    * )
      # Handle AmgiaOS, CPM, and modified cable modems here.
      ;;
  esac
} 
# Get the right installer
os_type
echo "Creating Links"
SOURCES=`ls . | grep -Ev 'docs|install.sh|README|config'`
for f in $SOURCES; do
  echo "Creating link ."$f
  ln -f $f ~/.$f
done
echo "Copying content of config"
mkdir ~/.config
cp -r config/* ~/.config/

# Install ZSH
echo "Installing zsh"
$INSTALLER install zsh

# Changing shell
echo "Changing shell default to zsh"
chsh -s /bin/zsh

# ANTIGEN
echo "Installing antigen. A plugin manager for zsh"
curl https://cdn.rawgit.com/zsh-users/antigen/v1.2.1/bin/antigen.zsh > antigen.zsh
mkdir -p .antigen/antigen
mv antigen.zsh .antigen/antigen/.

# PIP
echo "Installing pip"
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py

# VIRTUALENV WRAPPER
echo "Installing virtualenvwrapper"
sudo -H pip install virtualenvwrapper

# POWERLINE
echo "Installing Powerline"
sudo -H pip install git+git://github.com/Lokaltog/powerline

# vim
echo "Installing Vim"
$INSTALLER vim

# Vundle
echo "Installing Vundle & Updating plugins"
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
vim +PluginInstall +qall
