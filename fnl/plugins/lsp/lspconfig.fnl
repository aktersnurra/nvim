;; Setup of lsps.

(fn on-attach []
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (fn [args]
                                            (let [keymaps (require :plugins.lsp.keymaps)
                                                  buffer (. args :buf)]
                                              (keymaps.on-attach buffer)))}))

(fn config []
  (on-attach)
  (let [diagnostics (require :plugins.lsp.diagnostics)
        mason-lspconfig (require :plugins.lsp.mason-lspconfig)
        ui (require :lspconfig.ui.windows)]
    (set ui.default_options.border :single)
    (diagnostics.setup)
    (mason-lspconfig.setup)))

{1 :neovim/nvim-lspconfig
 :event :BufReadPost
 :dependencies [:mason.nvim
                :williamboman/mason-lspconfig.nvim
                :b0o/schemastore.nvim
                :hrsh7th/cmp-nvim-lsp]
 : config}
