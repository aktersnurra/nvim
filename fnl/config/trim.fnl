;; Trim whitespaces on save.
(module config.trim {autoload {:util :config.util}})

(def- opts {:disable [:python]})

(util.setup :trim opts)
