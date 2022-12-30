;; Load plugins with packer.
(module init {require [settings config.autocmd config.cmd]})

(let [lazy (require :lazy)
      opts (require :config.lazy)
      plugins (require :plugins)]
  (lazy.setup plugins opts))
