;; Load plugins with packer.
(module init {require [settings config.autocmd config.cmd]})

(let [lazy (require :lazy) plugins (require :plugins)]
  (lazy.setup plugins))
