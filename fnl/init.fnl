;; Load plugins with packer.
(module init
        {autoload {: plugins }
         require [settings config.autocmd config.cmd]})

(let [lazy (require :lazy)]
  (lazy.setup plugins.all))
