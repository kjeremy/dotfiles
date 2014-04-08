#!/bin/bash

# Symlinks dot files into home directory
# and backs up old ones to $old_dir

# Setup variables
dir=~/dotfiles
old_dir=~/dotfiles_old
files="vimrc"

# create backup directory
echo "Creating $old_dir for backup of any existing dotfiles in ~"
mkdir -p $old_dir
echo "...done"

echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old, then create symlinks
for file in $files; do
  echo "Moving any existing dotfiles from ~ to $old_dir"
  mv ~/.$file $old_dir
  echo "Creating symlink to $file in home directory."
  ln -s $dir/$file ~/.$file
done
