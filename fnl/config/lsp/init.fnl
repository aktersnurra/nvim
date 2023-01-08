;; Lsp modules.

(local plugins [:config.lsp.lspconfig :config.lsp.mason :config.lsp.null-ls])

(let [util (require :config.util)]
  (util.load plugins))
