;; Install, load settings, and load plugin configs.
(module init)
(require :settings)
(require :install)
(if (> (# (vim.fn.readdir path)) 3)
  (require :config))
