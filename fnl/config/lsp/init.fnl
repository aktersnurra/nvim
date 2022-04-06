;; Loads the LSP module.
(module config.lsp.init
  {autoload {util util}})

(let [(ok? _) util.load-plugin :lspconfig]
  (when ok?
    (do
      (require :config.lsp.lsp-installer)
      ((require :config.lsp.handlers).setup)
      (require :config.lsp.null-ls))))


