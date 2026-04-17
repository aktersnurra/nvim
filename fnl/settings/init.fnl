;; Load nvim settings

(import-macros {: autocmd} :macros)

(require :settings.options)
(require :settings.terminal)

(autocmd :User {:group (vim.api.nvim_create_augroup :Lazy {:clear true})
                :pattern :VeryLazy
                :callback (λ []
                            (require :settings.autocmds)
                            (require :settings.keymaps))})
