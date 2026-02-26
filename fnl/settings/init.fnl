;; Load nvim settings

(require :settings.options)
(require :settings.terminal)

(vim.api.nvim_create_autocmd :User
                             {:group (vim.api.nvim_create_augroup :Lazy
                                                                  {:clear true})
                              :pattern :VeryLazy
                              :callback (λ []
                                          (require :settings.autocmds)
                                          (require :settings.keymaps))})
