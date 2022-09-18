;; Loads the LSP functionality.
(module config.lsp.init {autoload {: util}})

(require :config.lsp.mason)
(require :config.lsp.mason-lspconfig)
(require :config.lsp.mason-null-lsp)
(let [handlers (require :config.lsp.handlers)]
  (handlers.setup))

(require :config.lsp.null-ls)
