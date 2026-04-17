;; Key mappings for lsp.

(import-macros {: keymaps} :macros)

(λ on-attach [buffer]
  (keymaps [:n
            :gD
            "<cmd>lua vim.lsp.buf.declaration()<CR>"
            {:desc :Declaration : buffer}]
           [:n
            :gd
            "<cmd>Telescope lsp_definitions theme=get_dropdown<cr>"
            {:desc :Definition : buffer}]
           [:n
            :gI
            "<cmd>Telescope lsp_implementations theme=get_dropdown<cr>"
            {:desc :Implementation : buffer}]
           [:n
            :gr
            "<cmd>Telescope lsp_references theme=get_dropdown<cr>"
            {:desc :References : buffer}]
           [:n
            :gl
            "<cmd>lua vim.diagnostic.open_float()<CR>"
            {:desc :Diagnostics : buffer}]
           [:n
            :gj
            "<cmd>Telescope diagnostics theme=get_dropdown<cr>"
            {:desc "Telescope Diagnostics" : buffer}]
           [:n
            :gw
            "<cmd>Telescope lsp_dynamic_workspace_symbols theme=get_dropdown<cr>"
            {:desc "Workspace Symbols" : buffer}]
           [:n
            :gE
            "<cmd>Telescope lsp_type_definitions theme=get_dropdown<cr>"
            {:desc "Type Definitions" : buffer}]
           [:n
            :gm
            "<cmd>lua vim.lsp.buf.signature_help()<CR>"
            {:desc :Signature : buffer}]
           [:n
            :gM
            "<cmd>Telescope lsp_document_symbols theme=get_dropdown<cr>"
            {:desc "Document Symbols" : buffer}]
           [:n
            :gh
            "<cmd>lua vim.lsp.buf.code_action()<cr>"
            {:desc "Code Action" : buffer}]
           [:n
            :gb
            "<cmd>lua vim.lsp.codelens.run()<cr>"
            {:desc "Code Lens" : buffer}]
           [:n
            :K
            "<cmd>lua vim.lsp.buf.hover()<cr>"
            {:desc "Hover documentation" : buffer}]
           [:n :<leader>li :<cmd>LspInfo<cr> {:desc "Lsp Info" : buffer}]))

{: on-attach}
