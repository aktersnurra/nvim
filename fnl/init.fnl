;; Install, load settings, and load plugin configs.
(module init
  {autoload {util util}})

(require :settings)
(require :config.packer)
(require :install)
(util.load-config)
