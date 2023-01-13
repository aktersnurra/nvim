;; Key mappings for lsp.

(local opts {:noremap true :silent true})

(local mappings
       [[:n :gD "<cmd>lua vim.lsp.buf.declaration()<CR>"]
        [:n :gd "<cmd>lua vim.lsp.buf.definition()<CR>"]
        [:n :gI "<cmd>lua vim.lsp.buf.implementation()<CR>"]
        [:n :gr "<cmd>lua vim.lsp.buf.references()<CR>"]
        [:n :gl "<cmd>lua vim.diagnostic.open_float()<CR>"]
        [:n :gs "<cmd>lua vim.lsp.buf.signature_help()<CR>"]])

(fn on-attach [bufnr]
  (each [_ mapping (ipairs mappings)]
    (match mapping
      [mode key cmd] (vim.api.nvim_buf_set_keymap bufnr mode key cmd opts))))

{: on-attach}
