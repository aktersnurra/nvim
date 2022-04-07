;; LSP installer.
(module config.lsp.lsp-installer
  {autoload {util util}})

(def- opts 
  {:on_attach: (require :config.lsp.handlers).on_attach
   :capabilities ((require :config.lsp.handlers).capabilities)})

(defn- get-server-opts [server]
  (when (= server.name :jsonls)
    (let [jsonls-opts (require :config.lsp.settings.jsonls)]
      (vim.tbl_deep_extend :force jsonls-opts opts)))
  (when (= server.name :sumneko_lua)
    (let [sumneko-lua-opts (require :config.lsp.settings.sumneko-lua)]
      (vim.tbl_deep_extend :force sumneko-lua-opts opts)))
  (when (= server.name :pyright)
    (let [pyright-opts (require :config.lsp.settings.pyright)]
      (vim.tbl_deep_extend :force pyright-opts opts))))


(let [lsp-installer (util.load-plugin :lsp-installer)]
  (lsp-installer.on_server_ready (fn [server]
    (let [opts (get-server-opts server)]
      server:setup opts)))))
