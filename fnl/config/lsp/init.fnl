;; Loads the LSP module.
(module config.lsp.init {autoload {util util}})

(let [_ (util.load-plugin :lspconfig)]
  (require :config.lsp.lsp-installer)
  (require :config.lsp.handlers)
  (require :config.lsp.null-ls))
