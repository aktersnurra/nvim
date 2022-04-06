;; Json schema store catalog language server.
(module config.lsp.settings.jsonls
  {autoload {util util}})

(let [(ok? schemastore) util.load-plugin :schemastore]
  (when ok?
    (schemastore.setup 
      {:init_options {
        :providerFormatter false}
       :settings {
        :json {
          :schemas (schemastore.json.schemas)}}
       :setup {
        :commands {
          :Format {
            (fn []
              (vim.lsp.buf.range_formatting {} [ 0 0 ] [ (vim.fn.line "$" 0) ]))}}}})))
