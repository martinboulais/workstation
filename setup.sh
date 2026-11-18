#!/usr/bin/env bash

# Alacritty configuration
mkdir -p $HOME/.config/alacritty
ln -sf $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# i3 configuration
mkdir -p $HOME/.config/i3
ln -sf $PWD/i3.conf $HOME/.config/i3/config
mkdir -p $HOME/.local/assets
ln -sf $PWD/assets/wallpaper.jpg $HOME/.local/assets/wallpaper.jpg
