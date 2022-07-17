;; Install, load settings, and load plugin configs.
(module init {autoload {: util} require [settings config.packer]})

(util.load-plugins)
