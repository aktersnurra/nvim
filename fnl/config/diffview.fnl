;; Trim whitespaces on save.
(module config.diffview {autoload {:util :config.util}})

(def- opts {})

(util.setup :diffview opts)
