;; Load neovim colorscheme.
(module config.colorscheme {autoload {util util}})

(local colorscheme :no-clown-fiesta)

(pcall vim.cmd (.. "colorscheme " colorscheme))
