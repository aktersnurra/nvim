;; Handlers for the requests and responses from and to the lsp server.
(module config.lsp.handlers
  {autoload {util util
             nvim aniseed.nvim}})

(def- signs
  [{:name :DiagnosticSignError :text ""}
   {:name :DiagnosticSignWarn :text ""}
   {:name :DiagnosticSignHint :text ""}
   {:name :DiagnosticSignInfo :text ""}])

(defn- apply-signs []
  (each [_ sign (ipairs signs)]
    (vim.fn.sign_define sign.name
      {:texthl sign.name
       :text sign.text
       :numhl ""})))

(def- config
  {:virtual_text false
   :signs {:active signs}
   :update_in_insert true
   :underline true
   :severity_sort true
   :float {:focusable false
           :style :minimal
           :border :rounded
           :source :always
           :header ""
           :prefix ""}})

(defn setup []
  (apply-signs)
  (vim.diagnostic.config config)
  (set vim.lsp.handlers.textDocument/hover
    (vim.lsp.with {:border :rounded}))
  (set vim.lsp.handlers.textDocument/signatureHelp
    (vim.lsp.with vim.lsp.handlers.signature_help {:border :rounded})))

(defn- lsp-keymaps [bufnr]
  (let [opts {:noremap true :silent true}]
    (nvim.buf_set_keymap bufnr :n :gD
                         "<cmd>lua vim.lsp.buf.declaration()<CR>" opts)
    (nvim.buf_set_keymap bufnr :n :gd
                         "<cmd>lua vim.lsp.buf.definition()<CR>" opts)
    (nvim.buf_set_keymap bufnr :n :K "<cmd>lua vim.lsp.buf.hover()<CR>"
                         opts)
    (nvim.buf_set_keymap bufnr :n :gI
                         "<cmd>lua vim.lsp.buf.implementation()<CR>" opts)
    (nvim.buf_set_keymap bufnr :n :gr
                         "<cmd>lua vim.lsp.buf.references()<CR>" opts)
    (nvim.buf_set_keymap bufnr :n :gl
                         "<cmd>lua vim.diagnostic.open_float()<CR>" opts)
    (nvim.buf_set_keymap bufnr :n :<leader>q
                         "<cmd>lua vim.diagnostic.setloclist()<CR>" opts)))

(defn on-attach [client bufnr]
  (if (= client.name :html)
    (set client.resolved_capabilities.document_formatting false))
  (lsp-keymaps bufnr))

(defn capabilities []
  (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
    (set capabilities.textDocument.completion.completionItem.snippetSupport true)
      (let [cmp-nvim-lsp (util.load-plugin :cmp_nvim_lsp)]
        (cmp-nvim-lsp.update_capabilities capabilities))))
