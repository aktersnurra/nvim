;; Loads the LSP functionality.
(module config.lsp.init {autoload {util util}})

(require :config.lsp.lsp-installer)
(let [handlers (require :config.lsp.handlers)]
    (handlers.setup))
(require :config.lsp.null-ls)
