;; Mason manages external tooling, e.g. lsp, formatters, and linters.

(local opts {:ui {:border :single
                  :icons {:package_installed " "
                          :package_pending " "
                          :package_uninstalled " "}}
             :max_concurrent_installers 10})

{1 :williamboman/mason.nvim
 :cmd :Mason
 :keys [{1 :<leader>m 2 :<cmd>Mason<cr> :desc :Mason}]
 : opts}
