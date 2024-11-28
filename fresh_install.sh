#!/bin/bash

# Updating and upgrading Kali

echo -e "[+] Updating and Upgrading the machine\n"
apt update && apt upgrade -y

# Downloading and executing pimpmykali

echo -e "[+] Installing and running pimpmykali\n"

## Cloning the pimpmykali GitHub repo

git clone https://github.com/Dewalt-arch/pimpmykali.git
cd pimpmykali/
chmod +x pimpmykali.sh
./pimpmykali.sh --all

# Installing Neovim

echo -e "[+] Installing Neovim\n"
curl -LO https://github.com/neovim/neovim/releases/latest/download/nvim-linux64.tar.gz
sudo rm -rf /opt/nvim
sudo tar -C /opt -xzf nvim-linux64.tar.gz

## Adding Neovim to Environment path

echo 'export PATH="$PATH:/opt/nvim-linux64/bin"' >> ~/.zshrc

# Installing NerdFonts

echo -e "[+] Installing NerdFonts\n"
wget -P ~/.local/share/fonts https://github.com/ryanoasis/nerd-fonts/releases/download/v3.3.0/IosevkaTerm.zip 
cd ~/.local/share/fonts
unzip IosevkaTerm.zip
rm IosevkaTerm.zip
fc-cache -fv

# Installing NvChad 

echo -e "[+] Installing NvChad\n"
git clone https://github.com/NvChad/starter ~/.config/nvim

echo -e "\n[*] Run nvim to initialize NvChad\n"

# Installing useful cli tools

echo -e "[+] Installing useful CLI tools\n"
apt install fzf fd-find bat eza gh xsel

# Installing konsole 

apt install konsole

# Applying all changes in .zshrc that was pulled

source .zshrc
