;; Mason manages external tooling, e.g. lsp, formatters, and linters.
(module config.lsp.mason {autoload {:util :config.util}})

(def- opts {:ui {:icons {:package_installed "✓"
                         :package_pending "➜"
                         :package_uninstalled "✗"}}
            :max_concurrent_installers 10})

(util.setup :mason opts)
