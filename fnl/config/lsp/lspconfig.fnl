;; Setup of lsps.
(module config.lsp.lspconfig {autoload {util config.util lsp config.lsp.keymaps}})

(defn on-attach [client bufnr] (if (= client.name :html)
                                   (set client.server_capabilities.document_formatting
                                        false))
      (lsp.keymaps bufnr))

(defn capabilities []
      (let [capabilities (vim.lsp.protocol.make_client_capabilities)]
        (set capabilities.textDocument.completion.completionItem.snippetSupport
             true)
        (let [cmp-nvim-lsp (util.prequire :cmp_nvim_lsp)]
          (cmp-nvim-lsp.default_capabilities capabilities))))

(defn- handler-opts [] {:on_attach on-attach :capabilities (capabilities)})

(defn- jsonls-opts []
       (let [jsonls-opts (require :config.lsp.settings.jsonls)]
         (vim.tbl_deep_extend :force jsonls-opts (handler-opts))))

(defn- sumneko-lua-opts []
       (let [sumneko-lua (require :config.lsp.settings.sumneko-lua)]
         (vim.tbl_deep_extend :force sumneko-lua.opts (handler-opts))))

(defn- rust-opts []
       (let [rust (require :config.lsp.settings.rust)]
         (vim.tbl_deep_extend :force rust.opts (handler-opts))))

(defn- get-server-opts [server]
       (match server
         :jsonls (jsonls-opts)
         :sumneko_lua (sumneko-lua-opts)
         :rust_analyzer (rust-opts)
         _ (handler-opts)))

(let [lspconfig (util.prequire :lspconfig) servers (require :config.lsp.servers)]
  (each [_ server (ipairs servers)]
    (let [server-config (. lspconfig server)]
      (server-config.setup (get-server-opts server)))))
