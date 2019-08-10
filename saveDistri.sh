#!/bin/sh

cd ~/agordo

# Saving codium extensions
codium --list-extensions > ~/agordo/codiumExtensions.list
cat ~/.bashrc > ./configs/.bashrc
cat ~/.zshrc > ./configs/.zshrc

git add .
git commit -am "New config"
git push
