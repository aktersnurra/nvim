;; Show lsp progress.
(module config.fidget {autoload {: util}})

(def- opts {:text {:spinner :dots_snake}})

(util.use-config :fidget opts)
