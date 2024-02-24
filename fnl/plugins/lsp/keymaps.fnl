;; Key mappings for lsp.

(local opts {:noremap true :silent true})

(local mappings
       [[:n :gD "<cmd>lua vim.lsp.buf.declaration()<CR>" {:desc :Declaration}]
        [:n :gd "<cmd>lua vim.lsp.buf.definition()<CR>" {:desc :Definition}]
        [:n
         :gI
         "<cmd>lua vim.lsp.buf.implementation()<CR>"
         {:desc :Implementation}]
        [:n :gr "<cmd>lua vim.lsp.buf.references()<CR>" {:desc :References}]
        [:n
         :gl
         "<cmd>lua vim.diagnostic.open_float()<CR>"
         {:desc :Diagnostics}]
        [:n :gs "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:desc :Signature}]
        [:n
         :gh
         "<cmd>lua vim.lsp.buf.code_action()<cr>"
         {:desc "Code Action"}]
        [:n
         :gb
         "<cmd>lua vim.lsp.codelens.run()<cr>"
         {:desc "Code Lens"}]
        [:n :<leader>li :<cmd>LspInfo<cr> {:desc "Lsp Info"}]])

(fn on-attach [buffer]
  (each [_ mapping (ipairs mappings)]
    (match mapping
      [mode key cmd desc] (vim.api.nvim_buf_set_keymap buffer mode key cmd
                                                       (vim.tbl_extend :force
                                                                       opts desc)))))

{: on-attach}
