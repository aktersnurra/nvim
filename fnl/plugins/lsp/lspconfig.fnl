;; Setup of lsps.

(fn on-attach []
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (fn [args]
                                            (let [keymaps (require :plugins.lsp.keymaps)
                                                  buffer (. args :buf)]
                                              (keymaps.on-attach buffer)))}))

(fn capabilities []
  (let [cmp-lsp (require :cmp_nvim_lsp)]
    (cmp-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))))

(fn handlers [server]
  (let [servers (require :plugins.lsp.servers)
        lspconfig (require :lspconfig)]
    (let [config (. lspconfig server)
          opts (or (. servers server) {})]
      (tset opts :capabilities (capabilities))
      (config.setup opts))))

(fn opts []
  (let [servers (require :plugins.lsp.servers)]
    {:ensure_installed (vim.tbl_keys servers)
     :automatic_installation true
     :handlers [handlers]}))

(fn config []
  (on-attach)
  (let [diagnostics (require :plugins.lsp.diagnostics)
        ui (require :lspconfig.ui.windows)
        mason-lspconfig (require :mason-lspconfig)]
    (diagnostics.setup)
    (set ui.default_options.border :single)
    (mason-lspconfig.setup (opts))))

{1 :neovim/nvim-lspconfig
 :event :BufReadPost
 :dependencies [:mason.nvim
                :williamboman/mason-lspconfig.nvim
                :b0o/schemastore.nvim
                :hrsh7th/cmp-nvim-lsp]
 : config}
