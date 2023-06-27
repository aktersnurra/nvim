;; List of lsp that should be automatically installed and supported.

{:bashls {}
 :clangd {}
 :cssls {}
 :dockerls {}
 :hls {}
 :html {}
 :jsonls {:init_options {:providerFormatter false}
          :settings {:json {:schemas (let [schemastore (require :schemastore)]
                                       (schemastore.json.schemas))}}
          :setup {:commands {:Format [(fn []
                                        (vim.lsp.buf.range_formatting [] [0 0]
                                                                      [(vim.fn.line "$"
                                                                                    0)]))]}}}
 :ocamllsp {}
 :pyright {}
 :rust_analyzer {:settings {:rust-analyzer {:lens {:enable true}
                                            :checkOnSave {:command :clippy}}}}
 :lua_ls {:settings {:Lua {:completion {:callSnippet :Replace}
                           :workspace {:checkThirdParty false}
                           :runtime {:version :LuaJIT
                                     :path (vim.split package.path ";")}}}}
 :taplo {}
 :terraformls {}
 :texlab {}
 :tflint {}
 :yamlls {}
 :zk {}}
