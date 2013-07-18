#!/usr/bin/env sh

endpath="$HOME/.vim"

echo "start installing\n"

# Backup existing .vim stuff
echo "backing up current vim config\n"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done


echo "cloning dot-vimrc\n"
git clone --recursive -b xw http://github.com/xw2423/dot-vimrc.git $endpath
ln -sf $endpath/.vimrc $HOME/.vimrc
ln -sf $endpath/.gitconfig $HOME

echo "installing vundle"
git clone http://github.com/gmarik/vundle.git $endpath/bundle/vundle

echo "installing plugins using Vundle"
vim +BundleInstall! +BundleClean +q

