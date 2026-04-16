;; LSP configuration.

(λ config []
  (vim.api.nvim_create_autocmd :LspAttach
                               {:callback (λ [args]
                                            (let [{: on-attach} (require :plugins.lsp.keymaps)]
                                              (on-attach args.buf)))})
  (let [diagnostics (require :plugins.lsp.diagnostics)
        mason-lspconfig (require :plugins.lsp.mason-lspconfig)]
    (diagnostics.setup)
    (mason-lspconfig.setup)))

(local icons (require :settings.icons))

[{1 :neovim/nvim-lspconfig
  :event :BufNew
  :dependencies [:mason.nvim
                 :williamboman/mason-lspconfig.nvim
                 :b0o/schemastore.nvim
                 :saghen/blink.cmp]
  : config}
 {1 :williamboman/mason.nvim
  :cmd :Mason
  :keys [{1 :<leader>m 2 :<cmd>Mason<cr> :desc :Mason}]
  :opts {:ui {:border :single
              :icons {:package_installed (.. (. icons :checkmark) " ")
                      :package_pending (.. (. icons :arrow-right) " ")
                      :package_uninstalled (.. (. icons :close) " ")}}
         :max_concurrent_installers 10}}]
