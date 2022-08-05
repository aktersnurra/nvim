;; Prevent the cursor from moving when using shift and filter actions.
(module config.stay-in-place {autoload {: util}})

(util.use-config :stay-in-place {})
