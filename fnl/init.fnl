;; Load plugins with packer.
(module init
        {autoload {: plugins : packer}
         require [settings config.autocmd config.cmd config.packer]})

(packer.startup (fn [use]
                  (each [_ plugin (pairs plugins.all)]
                    (use plugin))))
