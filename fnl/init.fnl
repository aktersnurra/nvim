;; Load plugins with packer.
(module init
        {autoload {: plugins : packer}
         require [settings config.packer config.autocmd config.cmd]})

(packer.startup (fn [use]
                  (each [_ plugin (pairs plugins.all)]
                    (use plugin))))
