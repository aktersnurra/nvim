;; List of lsp that should be automatically installed and supported.

{:bashls {}
 :clangd {}
 :cssls {}
 :dockerls {}
 :elixirls {}
 :hls {}
 :html {}
 :jsonls {:init_options {:providerFormatter false}
          :settings {:json {:schemas (let [schemastore (require :schemastore)]
                                       (schemastore.json.schemas))
                            :validate {:enable true}}}
          :setup {:commands {:Format [(λ []
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
 :texlab {}
 :vale_ls {:filetypes [:markdown :text :org]}
 :sqls {}
 :yamlls {:settings {:yaml {:schemastore {:enable false :url ""}
                            :schemas (let [schemastore (require :schemastore)]
                                       (schemastore.yaml.schemas))}}}}
