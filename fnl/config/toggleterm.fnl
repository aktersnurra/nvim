;; Terminal inside nvim.
(module config.toggleterm {autoload {: util}})

(def- opts {:shade_terminals false})

(util.use-config :toggleterm opts)
