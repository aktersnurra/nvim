;; Install, load settings, and load plugin configs.
(module init {autoload {util util}})
(require :settings)
(require :install)
(if (> util.num-plugins 3)
    (require :config))
