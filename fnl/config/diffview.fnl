;; Trim whitespaces on save.
(module config.diffview {autoload {: util}})

(def- opts {})

(util.use-config :diffview opts)
