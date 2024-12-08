#!/bin/sh


DIR=$(dirname "$(realpath "$0")")
ln -sfv ${DIR}/config/nvim/init.lua ~/.config/nvim/init.lua
ln -sfv ${DIR}/config/nvim/.luarc.json ~/.config/nvim/.luarc.json
ln -sfv ${DIR}/.tmux.conf ~/.tmux.conf
ln -sfv ${DIR}/.ideavimrc ~/.ideavimrc
ln -sfv ${DIR}/.gitconfig ~/.gitconfig
ln -sfv ${DIR}/.tigrc ~/.tigrc
ln -sfv ${DIR}/.zshrc ~/.zshrc
mkdir -p ~/.config/zabrze
ln -sfv ${DIR}/config/zabrze/config.yaml ~/.config/zabrze/config.yaml
mkdir -p ~/.config/wezterm
ln -sfv ${DIR}/config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
