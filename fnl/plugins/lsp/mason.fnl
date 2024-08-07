;; Mason manages external tooling, e.g. lsp, formatters, and linters.

(local icons (require :settings.icons))

(local opts {:ui {:border :single
                  :icons {:package_installed (.. (. icons :checkmark) " ")
                          :package_pending (.. (. icons :arrow-right) " ")
                          :package_uninstalled (.. (. icons :close) " ")}}
             :max_concurrent_installers 10})

{1 :williamboman/mason.nvim
 :cmd :Mason
 :keys [{1 :<leader>m 2 :<cmd>Mason<cr> :desc :Mason}]
 : opts}
