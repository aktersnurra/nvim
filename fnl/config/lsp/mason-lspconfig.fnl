;; Automatic installation and updating of some lsps.
(module config.lsp.mason-lspconfig {autoload {util config.util}})

(def- servers (require :config.lsp.servers))

(def- opts {:ensure_installed servers :automatic_installation true})

(util.setup :mason-lspconfig opts)
