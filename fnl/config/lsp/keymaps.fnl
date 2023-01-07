;; Key mappings for lsp.
(module config.lsp.keymaps {autoload {nvim aniseed.nvim}})

(defn on-attach [bufnr] (let [opts {:noremap true :silent true}]
                          (nvim.buf_set_keymap bufnr :n :gD
                                               "<cmd>lua vim.lsp.buf.declaration()<CR>"
                                               opts)
                          (nvim.buf_set_keymap bufnr :n :gd
                                               "<cmd>lua vim.lsp.buf.definition()<CR>"
                                               opts)
                          (nvim.buf_set_keymap bufnr :n :gI
                                               "<cmd>lua vim.lsp.buf.implementation()<CR>"
                                               opts)
                          (nvim.buf_set_keymap bufnr :n :gr
                                               "<cmd>lua vim.lsp.buf.references()<CR>"
                                               opts)
                          (nvim.buf_set_keymap bufnr :n :gl
                                               "<cmd>lua vim.diagnostic.open_float()<CR>"
                                               opts)
                          (nvim.buf_set_keymap bufnr :n :gs
                                               "<cmd>lua vim.lsp.buf.signature_help()<CR>"
                                               opts)))
