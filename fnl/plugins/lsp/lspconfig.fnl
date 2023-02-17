;; Setup of lsps.

(fn on-attach []
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (fn [args]
                                            (let [keymaps (require :plugins.lsp.keymaps)
                                                  bufnr (. args :buf)]
                                              (keymaps.on-attach bufnr)))}))

(fn capabilities []
  (let [cmp-lsp (require :cmp_nvim_lsp)]
    (cmp-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))))

(fn mason-opts [servers]
  {:ensure_installed (vim.tbl_keys servers) :automatic_installation true})

(fn setup []
  (let [diagnostics (require :plugins.lsp.diagnostics)
        lspconfig (require :lspconfig)
        lspconfig-win (require :lspconfig.ui.windows)
        mason-lspconfig (require :mason-lspconfig)
        servers (require :plugins.lsp.servers)]
    (diagnostics.setup)
    (on-attach)
    (set lspconfig-win.default_options.border :single)
    (mason-lspconfig.setup (mason-opts servers))
    (mason-lspconfig.setup_handlers [(fn [server-name]
                                       (let [server-config (. lspconfig
                                                              server-name)
                                             opts (or (. servers server-name)
                                                      {})]
                                         (tset opts :capabilities
                                               (capabilities))
                                         (server-config.setup opts)))])))

{1 :neovim/nvim-lspconfig
 :event :BufReadPre
 :dependencies [:mason.nvim
                :williamboman/mason-lspconfig.nvim
                :b0o/SchemaStore.nvim
                :hrsh7th/cmp-nvim-lsp]
 :config (fn []
           (setup))}
