;; Prevent the cursor from moving when using shift and filter actions.
(module config.stay-in-place {autoload {:util :config.util}})

(util.setup :stay-in-place {})
