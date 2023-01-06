;; Handlers for the requests and responses from and to the lsp server.
(module config.lsp.handlers {autoload {util config.util nvim aniseed.nvim}})

(def- signs [{:name :DiagnosticSignError :text ""}
             {:name :DiagnosticSignWarn :text ""}
             {:name :DiagnosticSignHint :text ""}
             {:name :DiagnosticSignInfo :text ""}])

(defn- apply-signs [] (each [_ sign (ipairs signs)]
                        (vim.fn.sign_define sign.name
                                            {:texthl sign.name
                                             :text sign.text
                                             :numhl ""})))

(def- config {:virtual_text false
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

(do
  (apply-signs)
  (vim.diagnostic.config config)
  (set vim.lsp.handlers.textDocument/hover
       (vim.lsp.with {:border :rounded :width 60}))
  (set vim.lsp.handlers.textDocument/signatureHelp
       (vim.lsp.with vim.lsp.handlers.signature_help
                     {:border :rounded :width 60})))
