;; Trim whitespaces on save.
(module config.trim {autoload {: util}})

(def- opts {:disable [:python]})

(util.use-config :trim opts)
