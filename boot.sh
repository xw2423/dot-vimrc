#!/usr/bin/env sh

endpath="$HOME/.vim"

echo "start installing"

# Backup existing .vim stuff
echo "backing up current vim config"
today=`date +%Y%m%d`
for i in $HOME/.vim $HOME/.vimrc $HOME/.gvimrc; do [ -e $i ] && mv $i $i.$today; done


echo "cloning dot-vimrc"
git clone --recursive -b xw git://github.com/xw2423/dot-vimrc.git $endpath
ln -sf $endpath/vimrc $HOME/.vimrc
ln -sf $endpath/gitconfig $HOME/.gitconfig

echo "installing vundle"
git clone git://github.com/gmarik/vundle.git $endpath/bundle/vundle

echo "installing plugins using Vundle"
vim +BundleInstall! +BundleClean +q

