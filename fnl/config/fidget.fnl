;; Show lsp progress.
(module config.fidget {autoload {:util :config.util}})

(def- opts {:text {:spinner :dots_snake}})

(util.setup :fidget opts)
