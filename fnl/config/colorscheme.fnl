;; Load neovim colorscheme.
(module config.colorscheme {autoload {: util}})

(local colorscheme :no-clown-fiesta)

(set vim.g.bold_type true)

(pcall vim.cmd (.. "colorscheme " colorscheme))
