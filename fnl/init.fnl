;; Install, load settings, and load plugin configs.
(module init {autoload {util util}})
(require :settings)
(require :install)
(if (> util.num-plugins 3)
    (require :config)
    (vim.notify "Not loading config before plugins are downloaded"
                vim.log.levels.DEBUG))
