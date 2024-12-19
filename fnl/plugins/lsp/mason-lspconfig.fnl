;; A bridge plugin between mason and lspconfig, handles installation of lsp and 
;; setup hooks for client configurations.

(λ capabilities []
  (let [blink-cmp (require :blink.cmp)]
    (blink-cmp.get_lsp_capabilities)))

(λ handlers [server]
  (let [servers (require :plugins.lsp.servers)
        lspconfigs (require :lspconfig)]
    (let [lspconfig (. lspconfigs server)
          server-config (or (. servers server) {})]
      (tset server-config :capabilities (capabilities))
      (lspconfig.setup server-config))))

(λ setup []
  (let [mason-lspconfig (require :mason-lspconfig)
        servers (require :plugins.lsp.servers)]
    (mason-lspconfig.setup {:ensure_installed (vim.tbl_keys servers)
                            :automatic_installation true
                            :handlers [handlers]})))

{: setup}
