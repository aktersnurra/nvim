;; Load neovim colorscheme.
(module config.colorscheme {autoload {: util}})

(local colorscheme :no-clown-fiesta)

(pcall vim.cmd (.. "colorscheme " colorscheme))
