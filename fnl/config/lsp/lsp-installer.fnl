;; LSP installer.
(module config.lsp.lsp-installer {autoload {util util}})

(defn- handler-opts [] (let [handlers (require :config.lsp.handlers)]
             {:on_attach handlers.on-attach
              :capabilities handlers.capabilities}))

(defn- jsonls-opts []
  (let [jsonls-opts (require :config.lsp.settings.jsonls)]
           (vim.tbl_deep_extend :force jsonls-opts (handler-opts)))) 

(defn- sumneko-lua-opts []
  (let [sumneko-lua (require :config.lsp.settings.sumneko-lua)]
    (vim.tbl_deep_extend :force sumneko-lua.opts (handler-opts))))

(defn- pyright-opts []
  (let [pyright (require :config.lsp.settings.pyright)]
    (vim.tbl_deep_extend :force pyright.opts (handler-opts))))

(defn- get-server-opts [server]
       (match server.name
         "jsonls" (jsonls-opts)
         "pyright" (pyright-opts)
         "sumneko_lua" (sumneko-lua-opts)
         _ (handler-opts)))

(let [lsp-installer (util.load-plugin :nvim-lsp-installer)]
  (lsp-installer.on_server_ready (fn [server]
                                   (let [opts (get-server-opts server)]
                                     (server:setup opts)))))
