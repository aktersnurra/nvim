#!/bin/sh

# Check dependencies
which nvim >/dev/null 2>&1 ||
(echo "Neovim not installed!" && exit 1)
which luarocks >/dev/null 2>&1 ||
(echo "Luarocks not installed!" && exit 1)
luarocks list | grep "fennel" >/dev/null 2>&1 ||
(echo "fennel is not installed" && exit 1)

# Bootstrap installment
nvim --headless +qa &&
nvim --headless -c "autocmd User PackerComplete quitall"
