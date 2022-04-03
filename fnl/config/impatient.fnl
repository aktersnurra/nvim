;; Speeds up loading of plugins.
(module config.impatient
  {autoload {util util}})

(let [(ok? impatient) util.load-plugin :impatient]
  (when ok?
    (impatient.enable_profile)))

