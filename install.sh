cd ~
ln  -sf dotfiles/zshrc ~/.zshrc
ln  -sf dotfiles/zshenv ~/.zshenv
ln  -sf dotfiles/zprofile ~/.zprofile
ln  -sf dotfiles/zsh ~/.zsh
ln  -sf dotfiles/vimrc ~/.vimrc
sudo yum -y install zsh
chsh -s /bin/zsh
# ANTIGEN
curl https://cdn.rawgit.com/zsh-users/antigen/v1.2.1/bin/antigen.zsh > antigen.zsh
mkdir -p .antigen/antigen
mv antigen.zsh .antigen/antigen/.
# PIP
curl "https://bootstrap.pypa.io/get-pip.py" -o "get-pip.py"
sudo python get-pip.py
# VIRTUALENV WRAPPER
sudo pip install virtualenvwrapper
# POWER:INE
sudo pip install git+git://github.com/Lokaltog/powerline
#vundle
git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim
mkdir -p ~/.vim/autoload ~/.vim/bundle && \
curl -LSso ~/.vim/autoload/pathogen.vim https://tpo.pe/pathogen.vim
