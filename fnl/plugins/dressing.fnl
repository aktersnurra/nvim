;; UI for inputs

(local opts {:input {:enabled false}
             :select {:backend [:nui :telescope :builtin]}})

{1 :stevearc/dressing.nvim :event :BufReadPost : opts}
