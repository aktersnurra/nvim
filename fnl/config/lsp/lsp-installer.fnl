;; Loads default handlers and specific language settings.
(module config.lsp.lsp-installer {autoload {util util}})

(def handler-opts (let [handlers (require :config.lsp.handlers)]
                    {:on_attach handlers.on-attach
                     :capabilities (handlers.capabilities)}))

(def- jsonls-opts
      (let [jsonls-opts (require :config.lsp.settings.jsonls)]
        (vim.tbl_deep_extend :force jsonls-opts handler-opts)))

(def- sumneko-lua-opts
      (let [sumneko-lua (require :config.lsp.settings.sumneko-lua)]
        (vim.tbl_deep_extend :force sumneko-lua.opts handler-opts)))

(def- pyright-opts
      (let [pyright (require :config.lsp.settings.pyright)]
        (vim.tbl_deep_extend :force pyright.opts handler-opts)))

(defn- get-server-opts [server]
       (match server.name
         :jsonls jsonls-opts
         :pyright pyright-opts
         :sumneko_lua sumneko-lua-opts
         _ handler-opts))

(let [lsp-installer (util.load-plugin :nvim-lsp-installer)
      lspconfig (util.load-plugin :lspconfig)]
  (lsp-installer.setup)
  (each [_ server (ipairs (lsp-installer.get_installed_servers))]
    (let [server-config (. lspconfig server.name)]
      (server-config.setup (get-server-opts server)))))
