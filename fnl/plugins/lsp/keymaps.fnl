;; Key mappings for lsp.

(local mappings
       [[:n :gD "<cmd>lua vim.lsp.buf.declaration()<CR>" {:desc :Declaration}]
        [:n
         :gd
         "<cmd>Telescope lsp_definitions theme=get_dropdown<cr>"
         {:desc :Definition}]
        [:n
         :gI
         "<cmd>Telescope lsp_implementations theme=get_dropdown<cr>"
         {:desc :Implementation}]
        [:n
         :gr
         "<cmd>Telescope lsp_references theme=get_dropdown<cr>"
         {:desc :References}]
        [:n
         :gl
         "<cmd>lua vim.diagnostic.open_float()<CR>"
         {:desc :Diagnostics}]
        [:n
         :gj
         "<cmd>Telescope diagnostics theme=get_dropdown<cr>"
         {:desc "Telescope Diagnostics"}]
        [:n
         :gw
         "<cmd>Telescope lsp_dynamic_workspace_symbols theme=get_dropdown<cr>"
         {:desc "Workspace Symbols"}]
        [:n
         :gE
         "<cmd>Telescope lsp_type_definitions theme=get_dropdown<cr>"
         {:desc "Type Definitions"}]
        [:n :gm "<cmd>lua vim.lsp.buf.signature_help()<CR>" {:desc :Signature}]
        [:n
         :gM
         "<cmd>Telescope lsp_document_symbols theme=get_dropdown<cr>"
         {:desc "Document Symbols"}]
        [:n :gh "<cmd>lua vim.lsp.buf.code_action()<cr>" {:desc "Code Action"}]
        [:n :gb "<cmd>lua vim.lsp.codelens.run()<cr>" {:desc "Code Lens"}]
        [:n :K "<cmd>lua vim.lsp.buf.hover()<cr>" {:desc "Hover documentation"}]
        [:n :<leader>li :<cmd>LspInfo<cr> {:desc "Lsp Info"}]])

(λ on-attach [buffer]
  (let [opts {:noremap true :silent true : buffer}]
    (each [_ mapping (ipairs mappings)]
      (match mapping
        [mode key cmd desc]
        (vim.keymap.set mode key cmd (vim.tbl_extend :force opts desc))))))

{: on-attach}
