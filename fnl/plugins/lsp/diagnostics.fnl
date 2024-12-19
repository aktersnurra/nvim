;; Handlers for the requests and responses from and to the lsp server.

(local icons (require :settings.icons))

(local signs {vim.diagnostic.severity.ERROR (. icons :error)
              vim.diagnostic.severity.WARN (. icons :warn)
              vim.diagnostic.severity.INFO (. icons :info)
              vim.diagnostic.severity.HINT (. icons :hint)})

(local config {:virtual_text false
               :signs {:text signs}
               :update_in_insert false
               :underline true
               :severity_sort true
               :float {:focusable false
                       :style :minimal
                       :border :single
                       :source :always
                       :header ""
                       :prefix ""}})

(λ setup []
  (vim.diagnostic.config config)
  (set vim.lsp.handlers.textDocument/hover false)
  (set vim.lsp.handlers.textDocument/signatureHelp false))

{: setup}
