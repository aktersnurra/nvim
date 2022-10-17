;; Load plugins with packer.
(module init {autoload {: plugins : packer} require [settings config.packer config.autocmd]})

(packer.startup (fn [use]
                  (each [_ plugin (pairs plugins.all)]
                    (use plugin))))
