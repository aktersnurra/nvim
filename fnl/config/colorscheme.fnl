;; Load neovim colorscheme.
(module config.colorscheme {autoload {:util :config.util}})

(local colorscheme :no-clown-fiesta)

(def- opts {:type :bold})

(util.setup :no-clown-fiesta opts)
