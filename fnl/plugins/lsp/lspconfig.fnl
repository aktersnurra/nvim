;; Configuration for lsp clients.

(λ on-attach []
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (λ [args]
                                            (let [{: on-attach} (require :plugins.lsp.keymaps)
                                                  buffer (. args :buf)]
                                              (on-attach buffer)))}))

(λ config []
  (on-attach)
  (let [diagnostics (require :plugins.lsp.diagnostics)
        mason-lspconfig (require :plugins.lsp.mason-lspconfig)
        ui (require :lspconfig.ui.windows)]
    (set ui.default_options.border :single)
    (diagnostics.setup)
    (mason-lspconfig.setup)))

{1 :neovim/nvim-lspconfig
 :event :BufNew
 :dependencies [:mason.nvim
                :williamboman/mason-lspconfig.nvim
                :b0o/schemastore.nvim
                :saghen/blink.cmp]
 : config}
