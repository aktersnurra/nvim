;; Speeds up loading of plugins.
(module config.impatient
  {autoload {util util}})

(let [impatient (util.load-plugin :impatient)]
  (impatient.enable_profile))
