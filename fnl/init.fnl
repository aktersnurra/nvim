;; Install, load settings, and load plugin configs.
(module init
  {autoload {util util}
   require [settings
            config.packer]})

(util.install)
(util.sync)
(util.load-config)
