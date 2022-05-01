;; Config for a Lua language server.
(module config.lsp.settings.sumneko-lua)

(def- workspace
      {:library {(vim.fn.expand :$VIMRUNTIME/lua) true
                 (vim.fn.expand :$VIMRUNTIME/lua/vim/lsp) true}})

(def- diagnostics {:globals [:vim
                             :map
                             :filter
                             :range
                             :reduce
                             :head
                             :tail
                             :nth
                             :use
                             :describe
                             :it
                             :dump]})

(def- runtime {:version :LuaJIT :path (vim.split package.path ";")})

(def opts {:settings {:Lua {: diagnostics : workspace : runtime}}})
