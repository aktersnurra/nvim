;; Key mappings for lsp.

(fn on-attach [bufnr] (let [opts {:noremap true :silent true}]
                          (vim.api.nvim_buf_set_keymap bufnr :n :gD
                                               "<cmd>lua vim.lsp.buf.declaration()<CR>"
                                               opts)
                          (vim.api.nvim_buf_set_keymap bufnr :n :gd
                                               "<cmd>lua vim.lsp.buf.definition()<CR>"
                                               opts)
                          (vim.api.nvim_buf_set_keymap bufnr :n :gI
                                               "<cmd>lua vim.lsp.buf.implementation()<CR>"
                                               opts)
                          (vim.api.nvim_buf_set_keymap bufnr :n :gr
                                               "<cmd>lua vim.lsp.buf.references()<CR>"
                                               opts)
                          (vim.api.nvim_buf_set_keymap bufnr :n :gl
                                               "<cmd>lua vim.diagnostic.open_float()<CR>"
                                               opts)
                          (vim.api.nvim_buf_set_keymap bufnr :n :gs
                                               "<cmd>lua vim.lsp.buf.signature_help()<CR>"
                                               opts)))

{: on-attach}
