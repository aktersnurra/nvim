;; Json schema store catalog language server.
(module config.lsp.settings.jsonls {autoload {: util}})

(let [schemastore (util.load-plugin :schemastore)]
  {:init_options {:providerFormatter false}
   :settings {:json {:schemas (schemastore.json.schemas)}}
   :setup {:commands {:Format [(fn []
                                 (vim.lsp.buf.range_formatting [] [0 0]
                                                               [(vim.fn.line "$"
                                                                             0)]))]}}})
