;; Load plugins with lazy.
(module init {require [settings config.autocmd config.user-cmd]})

(let [lazy (require :lazy)
      opts (require :config.lazy)
      plugins (require :config)]
  (lazy.setup plugins opts))
