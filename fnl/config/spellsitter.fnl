;; Enable spell checking in comments.
(module config.spellsitter {autoload {: util}})

(def- opts {:enable true :debug false})

(util.use-config :spellsitter opts)
