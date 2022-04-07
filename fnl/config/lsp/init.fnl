;; Loads the LSP module.
(module config.lsp.init
  {autoload {util util}})

(let [_ (util.load-plugin :lspconfig)]
  (do
    (require :config.lsp.lsp-installer)
    ((require :config.lsp.handlers).setup)
    (require :config.lsp.null-ls)))
