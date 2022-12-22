;; TBD
(module config.lsp.mason-lspconfig {autoload {util config.util}})

(def- servers [:bashls
               :clangd
               :cssls
               :dockerls
               :hls
               :html
               :jsonls
               :rust_analyzer
               :sqls
               :sumneko_lua
               :taplo
               :terraformls
               :texlab
               :tflint
               :yamlls
               :zk])

(defn- handler-opts []
       (let [handlers (require :config.lsp.handlers)]
         {:on_attach handlers.on-attach :capabilities (handlers.capabilities)}))

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

(def- opts {:ensure_installed servers :automatic_installation true})

(util.setup :mason-lspconfig opts)

(let [lspconfig (util.prequire :lspconfig)]
  (each [_ server (ipairs servers)]
    (let [server-config (. lspconfig server)]
      (server-config.setup (get-server-opts server)))))
