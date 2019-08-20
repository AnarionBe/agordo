#!/bin/sh
# The MIT License (MIT)

# Copyright (c) 2019

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

agordo=${PWD}

cd ~
mkdir tmp
mkdir applications

# Install officials packages
sudo pacman -S base-devel zsh neofetch zsh-theme-powerlevel9k zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search tilda

cat $home/configs/.bashrc > ~/.bashrc

# Tilda config
cp -r ./configs/tilda ~/.config/tilda

# Install codium
git clone https://aur.archlinux.org/vscodium-bin.git ~/tmp/vscodium
cd ~/tmp/vscodium
makepkg -si

while IFS= read -r line
do
    codium --install-extension $line
done < "$HOME/agordo/codiumExtensions.list"

cp -r ~/configs/vscode ~/.config/VSCodium/User

# Configure zsh
cd ~/tmp
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
sudo mv "Hack Regular Nerd Font Complete Mono.ttf" /usr/share/fonts/TTF
fc-cache -f -v
cat $agordo/configs/.zshrc > ~/.zshrc

# install gitkraken
cd ~/tmp
wget https://release.gitkraken.com/linux/gitkraken-amd64.tar.gz
tar xvzf gitkraken-amd64.tar.gz
mv ./gitkraken ~/applications

# Install postman
cd ~/tmp
wget https://dl.pstmn.io/download/latest/linux\?arch\=64 -O postman.tar.gz
tar xvzf postman.tar.gz
mv ./Postman ~/applications


# Last one
rm -rf ~/tmp
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"