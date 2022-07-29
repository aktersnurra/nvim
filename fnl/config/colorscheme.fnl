;; Load neovim colorscheme.
(module config.colorscheme {autoload {: util}})

(local colorscheme :no-clown-fiesta)

(def- opts {:type :bold})

(util.use-config :no-clown-fiesta opts)
