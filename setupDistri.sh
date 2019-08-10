#!/bin/sh

home=${PWD}

cd ~
mkdir tmp
mkdir applications

# Install officials packages
sudo pacman -S base-devel zsh neofetch zsh-theme-powerlevel9k zsh-autosuggestions zsh-syntax-highlighting zsh-history-substring-search tilda

cat $home/configs/.bashrc > ~/.bashrc

# Install codium
git clone https://aur.archlinux.org/vscodium-bin.git ~/tmp/vscodium
cd ~/tmp/vscodium
makepkg -si
echo "alias code=codium" >> ~/.bashrc

while IFS= read -r line
do
    codium --install-extension $line
done < "$HOME/agordo/codiumExtensions.list"

# Configure zsh
cd ~/tmp
wget https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/Hack/Regular/complete/Hack%20Regular%20Nerd%20Font%20Complete%20Mono.ttf
# TODO: find a way to auto install the font
# The following 2 line might not working
sudo mv "Hack Regular Nerd Font Complete Mono.ttf" /usr/share/fonts/TTF
fc-cache -f -v
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
cat $home/configs/.zshrc > ~/.zshrc