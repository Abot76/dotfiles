#!/bin/bash

# empty the repo to remove all the files in case any were removed
rm -rf /home/bozic/Documents/GitHub/dotfiles/*

# recreate the folder structure
mkdir /home/bozic/Documents/GitHub/dotfiles/hypr
mkdir /home/bozic/Documents/GitHub/dotfiles/waybar
mkdir /home/bozic/Documents/GitHub/dotfiles/helix
mkdir /home/bozic/Documents/GitHub/dotfiles/alacritty
mkdir /home/bozic/Documents/GitHub/dotfiles/mc
mkdir /home/bozic/Documents/GitHub/dotfiles/rofi
mkdir /home/bozic/Documents/GitHub/dotfiles/zellij

# copy all the dotfiles
cp -rf /home/bozic/.config/hypr/* /home/bozic/Documents/GitHub/dotfiles/hypr/
cp -rf /home/bozic/.config/waybar/* /home/bozic/Documents/GitHub/dotfiles/waybar/
cp -rf /home/bozic/.config/helix/* /home/bozic/Documents/GitHub/dotfiles/helix/
cp -rf /home/bozic/.config/alacritty/* /home/bozic/Documents/GitHub/dotfiles/alacritty/
cp -rf /home/bozic/.config/mc/* /home/bozic/Documents/GitHub/dotfiles/mc/
cp -rf /home/bozic/.config/rofi/* /home/bozic/Documents/GitHub/dotfiles/rofi
cp -rf /home/bozic/.config/zellij/* /home/bozic/Documents/GitHub/dotfiles/zellij
cp -rf /home/bozic/.zshrc /home/bozic/Documents/GitHub/dotfiles/
cp -rf /home/bozic/.p10k.zsh /home/bozic/Documents/GitHub/dotfiles/

# cd into the repo and push the files
cd /home/bozic/Documents/GitHub/dotfiles

git add .
git commit -m "update dotfilse"
git push
