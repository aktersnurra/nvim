;; Setup of lsps.
(module config.lsp.lspconfig
        {autoload {nvim aniseed.nvim
                   util config.util
                   keymaps config.lsp.keymaps}})

(defn- on-attach []
       (nvim.create_autocmd :LspAttach
                            {:callback (fn [args]
                                         (let [bufnr (. args :buf)]
                                           (keymaps.on-attach bufnr)))}))

(defn- capabilities []
       (let [cmp-lsp (util.prequire :cmp_nvim_lsp)]
         (cmp-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))))

(defn- mason-opts [servers]
       {:ensure_installed (vim.tbl_keys servers) :automatic_installation true})

(let [lspconfig (util.prequire :lspconfig)
      mason-lspconfig (util.prequire :mason-lspconfig)
      servers (require :config.lsp.servers)]
  (on-attach)
  (mason-lspconfig.setup (mason-opts servers))
  (mason-lspconfig.setup_handlers [(fn [server-name]
                                     (let [server-config (. lspconfig
                                                            server-name)
                                           opts (or (. servers server-name) {})]
                                       (tset opts :capabilities (capabilities))
                                       (server-config.setup opts)))]))
