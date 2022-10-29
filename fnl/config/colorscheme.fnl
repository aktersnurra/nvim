;; Load neovim colorscheme.
(module config.colorscheme {autoload {util config.util}})

(local colorscheme :no-clown-fiesta)

(def- opts {:styles {:type {:bold true}}})

(util.setup :no-clown-fiesta opts)
(vim.cmd (.. "colorscheme " colorscheme))
