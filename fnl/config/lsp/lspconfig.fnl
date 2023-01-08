;; Setup of lsps.

(fn on-attach []
       (vim.api.nvim_create_autocmd :LspAttach
                                    {:callback (fn [args]
                                                 (let [keymaps (require :config.lsp.keymaps)
                                                       bufnr (. args :buf)]
                                                   (keymaps.on-attach bufnr)))}))

(fn capabilities []
       (let [cmp-lsp (require :cmp_nvim_lsp)]
         (cmp-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))))

(fn mason-opts [servers]
       {:ensure_installed (vim.tbl_keys servers) :automatic_installation true})

(fn setup []
  (require :config.lsp.diagnostics)
  (let [lspconfig (require :lspconfig)
        mason-lspconfig (require :mason-lspconfig)
        servers (require :config.lsp.servers)]
    (on-attach)
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
