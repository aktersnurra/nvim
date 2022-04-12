;; Config for a Lua language server.
(module config.lsp.settings.sumneko-lua)

(def- workspace
      {:library {(vim.fn.expand :$VIMRUNTIME/lua) true
                 (vim.fn.expand :$VIMRUNTIME/lua/vim/lsp) true}})


(def opts {:settings {:Lua {:diagnostics  {:globals [ :vim ]} :workspace  workspace}}})
