;; A bridge plugin between mason and lspconfig, handles installation of lsp and 
;; setup hooks for client configurations.

(λ capabilities []
  (let [cmp-lsp (require :cmp_nvim_lsp)]
    (cmp-lsp.default_capabilities (vim.lsp.protocol.make_client_capabilities))))

(λ handlers [server]
  (let [servers (require :plugins.lsp.servers)
        lspconfig (require :lspconfig)]
    (let [config (. lspconfig server)
          opts (or (. servers server) {})]
      (tset opts :capabilities (capabilities))
      (config.setup opts))))

(λ setup []
  (let [mason-lspconfig (require :mason-lspconfig)
        servers (require :plugins.lsp.servers)]
    (mason-lspconfig.setup {:ensure_installed (vim.tbl_keys servers)
                            :automatic_installation true
                            :handlers [handlers]})))

{: setup}
