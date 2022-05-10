;; Loads the LSP functionality.
(module config.lsp.init {autoload {util util}})

(let [handlers (require :config.lsp.handlers)]
    (handlers.setup))
(require :config.lsp.lsp-installer)
(require :config.lsp.null-ls)
