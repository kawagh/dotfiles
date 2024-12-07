#!/bin/sh
ln -sfv ${PWD}/nvim/init.lua ~/.config/nvim/init.lua
ln -sfv ${PWD}/.tmux.conf ~/.tmux.conf
ln -sfv ${PWD}/.ideavimrc ~/.ideavimrc
ln -sfv ${PWD}/.gitconfig ~/.gitconfig
ln -sfv ${PWD}/.tigrc ~/.tigrc
ln -sfv ${PWD}/.zshrc ~/.zshrc
mkdir -p ~/.config/zabrze
ln -sfv ${PWD}/.config/zabrze/config.yaml ~/.config/zabrze/config.yaml
