;; Loads the LSP module.
(module config.lsp.init
  {autoload {util util}})

(let [_ (util.load-plugin :lspconfig)]
  (require :config.lsp.lsp-installer)
  (let [handlers (require :config.lsp.handlers)]
    (handlers.setup))
  (require :config.lsp.null-ls))
