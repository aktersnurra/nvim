;; Loads default handlers and specific language settings.
(module config.lsp.lsp-installer {autoload {util util}})

(def- default-servers [:bashls
                       :clangd
                       :cssls
                       :dockerls
                       :html
                       :hls
                       :jsonls
                       :pyright
                       :rust_analyzer
                       :terraformls
                       :texlab
                       :tflint
                       :yamlls
                       :zk])

(defn- merge [default-servers installed-servers]
       (let [servers default-servers]
         (each [_ server (ipairs installed-servers)]
           (if (. servers server.name)
               (tset servers (+ (length servers) 1) server.name)))
         servers))

(def- handler-opts
      (let [handlers (require :config.lsp.handlers)]
        {:on_attach handlers.on-attach :capabilities (handlers.capabilities)}))

(def- jsonls-opts []
      (let [jsonls-opts (require :config.lsp.settings.jsonls)]
        (vim.tbl_deep_extend :force jsonls-opts handler-opts)))

(def- sumneko-lua-opts []
      (let [sumneko-lua (require :config.lsp.settings.sumneko-lua)]
        (vim.tbl_deep_extend :force sumneko-lua.opts handler-opts)))

(def- pyright-opts []
      (let [pyright (require :config.lsp.settings.pyright)]
        (vim.tbl_deep_extend :force pyright.opts handler-opts)))

(defn- get-server-opts [server]
       (match server
         :jsonls jsonls-opts
         :pyright pyright-opts
         :sumneko_lua sumneko-lua-opts
         _ handler-opts))

(let [lsp-installer (util.load-plugin :nvim-lsp-installer)
      lspconfig (util.load-plugin :lspconfig)]
  (let [servers (merge default-servers (lsp-installer.get_installed_servers))]
    (lsp-installer.setup {:ensure_installed servers})
    (each [_ server (pairs servers)]
      (let [server-config (. lspconfig server)]
        (server-config.setup (get-server-opts server))))))
