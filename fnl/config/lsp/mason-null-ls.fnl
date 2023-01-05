;; Automatic installation and updating lsp diagnostics etc..
(module config.lsp.mason-null-ls {autoload {util config.util}})

(def- opts {:ensure_installed nil :automatic_installation true :automatic_setup false})

(util.setup :mason-null-ls opts)
