;; Pretty diagnostics.

(local keys [{1 :<leader>tt
              2 "<cmd>Trouble diagnostics toggle<cr>"
              :desc "Diagnostics (Trouble)"}
             {1 :<leader>tn
              2 "<cmd>Trouble diagnostics toggle filter.buf=0<cr>"
              :desc "Buffer Diagnostics (Trouble)"}
             {1 :<leader>te
              2 "<cmd>Trouble lsp toggle focus=false win.position=bottom<cr>"
              :desc "LSP Definitions / references / ... (Trouble)"}
             {1 :<leader>ts
              2 "<cmd>Trouble symbols toggle focus=false win.position=bottom<cr>"
              :desc "Symbols (Trouble)"}])

(local opts {})

{1 :folke/trouble.nvim :cmd [:TroubleToggle :Trouble] : opts : keys}
