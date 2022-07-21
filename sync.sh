#!/bin/sh

CONFIG=$HOME/.config/nvim
rm -rf "$CONFIG/lua"

# Check dependencies
which nvim >/dev/null 2>&1 ||
	(echo "Neovim not installed!" && exit 1)
which fennel >/dev/null 2>&1 ||
	(echo "fennel is not installed" && exit 1)

# Bootstrap installment
(nvim --headless +qa >/dev/null 2>&1 &&
	nvim --headless +"au User PackerComplete qa" +PackerSync +TSUpdateSync >/dev/null 2>&1 &&
	echo "Successfully bootstrapped the config!") ||
	(echo "Bootstrapping failed..." && exit 1)
