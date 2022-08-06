;; Terminal inside nvim.
(module config.toggleterm {autoload {: util}})

(def- opts {})

(util.use-config :toggleterm opts)
