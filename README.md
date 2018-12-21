````
git clone git@github.com:jstuckey/.dotfiles.git

# link dotfiles
ln -s ~/.dotfiles/bash_profile ~/.bash_profile
ln -s ~/.dotfiles/inputrc ~/.inputrc
ln -s ~/.dotfiles/gitconfig ~/.gitconfig
ln -s ~/.dotfiles/vimrc ~/.vimrc
ln -s ~/.dotfiles/vim ~/.vim
ln -s ~/.dotfiles/tmux ~/.tmux.conf
ln -s ~/.dotfiles/git-completion.bash ~/.git-completion.bash

# vim plugins
git submodule update --init

# rbenv
git clone https://github.com/rbenv/rbenv.git ~/.rbenv
cd ~/.rbenv && src/configure && make -C src
git clone https://github.com/rbenv/ruby-build.git ~/.rbenv/plugins/ruby-build

````
