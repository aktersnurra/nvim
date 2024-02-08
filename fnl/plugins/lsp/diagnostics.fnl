;; Handlers for the requests and responses from and to the lsp server.

(local icons (require :settings.icons))

(local signs [{:name :DiagnosticSignError :text (. icons :error)}
              {:name :DiagnosticSignWarn :text (. icons :warn)}
              {:name :DiagnosticSignHint :text (. icons :hint)}
              {:name :DiagnosticSignInfo :text (. icons :info)}])

(fn configure-signs []
  (each [_ sign (ipairs signs)]
    (vim.fn.sign_define sign.name {:texthl sign.name :text sign.text :numhl ""})))

(local config {:virtual_text false
               :signs {:active signs}
               :update_in_insert false
               :underline true
               :severity_sort true
               :float {:focusable false
                       :style :minimal
                       :border :rounded
                       :source :always
                       :header ""
                       :prefix ""}})

(fn setup []
  (configure-signs)
  (vim.diagnostic.config config)
  (set vim.lsp.handlers.textDocument/hover false)
  (set vim.lsp.handlers.textDocument/signatureHelp false))

{: setup}
