;; Custom keymappings.

(local opts {:noremap true :silent true})

(local mappings [;;Remap space as leader key
                 ["" :<Space> :<Nop> {}]
                 ;; Normal ;;
                 ;; Resize with arrows
                 [:n :<m-f> :<c-w>+ {}]
                 [:n :<m-p> :<c-w>- {}]
                 [:n "<m-,>" :<c-w>5< {}]
                 [:n :<m-.> :<c-w>5> {}]
                 ;; Visual ;;
                 ;; Stay in indent mode
                 [:v "<" :<gv {}]
                 [:v ">" :>gv {}]
                 ;; Visual Block ;;
                 ;; Move text up and down
                 [:x :J ":move '>+1<CR>gv-gv" {}]
                 [:x :K ":move '<-2<CR>gv-gv" {}]
                 ;; Move text up and down
                 [:v :<c-n> ":m .+1<CR>==" {}]
                 [:v :<c-e> ":m .-2<CR>==" {}]
                 [:v :p "\"_dP" {}]
                 ;; Splits
                 [:n :<m-s> :<cmd>split<CR> {}]
                 [:n :<m-t> :<cmd>vsplit<CR> {}]
                 ;; Buf navigation
                 [:n :<c-n> :<cmd>bprev<CR> {}]
                 [:n :<c-e> :<cmd>bnext<CR> {}]
                 ;; Jump half a page and centralize the view
                 [:n :<c-d> :<c-d>zz {}]
                 [:n :<c-u> :<c-u>zz {}]
                 ;; Remove highlighted search
                 [:n :<m-h> :<cmd>nohlsearch<CR> {}]
                 ;; Force refresh
                 [:n :mj "<cmd>:e<CR>" {:desc :Refresh}]])

(each [_ mapping (ipairs mappings)]
  (match mapping
    [mode key cmd desc]
    (vim.api.nvim_set_keymap mode key cmd (vim.tbl_extend :force opts desc))))
