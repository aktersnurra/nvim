;; Load nvim settings

(require :settings.options)

(vim.api.nvim_create_autocmd :User
                             {:group (vim.api.nvim_create_augroup :Lazy
                                                                  {:clear true})
                              :pattern :VeryLazy
                              :callback (lambda []
                                          (require :settings.autocmds)
                                          (require :settings.keymaps)
                                          (require :settings.usercmds))})
