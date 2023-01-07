;; Config for the sumneko-lua language server.
(module config.lsp.settings.sumneko-lua)

(def- runtime {:version :LuaJIT :path (vim.split package.path ";")})

(def opts {:settings {:Lua {:completion {:callSnippet :Replace}
                            :workspace {:checkThirdParty false}
                            : runtime}}})
