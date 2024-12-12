#!/usr/bin/env bash

# Kitty configuration and theme
ln -sf $PWD/kitty.conf $HOME/.config/kitty/kitty.conf
ln -sf $PWD/kitty-theme.conf $HOME/.config/kitty/current-theme.conf

# nvim configuration
ln -sf $PWD/nvim.lua $HOME/.config/nvim/init.lua

# Alacritty configuration
mkdir -p $HOME/.config/alacritty
ln -sf $PWD/alacritty.yml $HOME/.config/alacritty/alacritty.yml

# lazygit configuration
ln -sf $PWD/lazygit.yml $HOME/.config/lazygit/config.yml
