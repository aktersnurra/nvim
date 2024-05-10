;; Custom keymappings.

(local opts {:noremap true :silent true})

(local mappings [;;Remap space as leader key
                 ["" :<Space> :<Nop> {}]
                 ;; Normal ;;
                 ;; Better window navigation
                 [:n :<C-h> :<C-w>h {}]
                 [:n :<C-j> :<C-w>j {}]
                 [:n :<C-k> :<C-w>k {}]
                 [:n :<C-l> :<C-w>l {}]
                 ;; Resize with arrows
                 [:n :<C-Up> ":resize -2<CR>" {}]
                 [:n :<C-Down> ":resize +2<CR>" {}]
                 [:n :<C-Left> ":vertical resize -2<CR>" {}]
                 [:n :<C-Right> ":vertical resize +2<CR>" {}]
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
                 ;; Close window
                 [:n :Q "<cmd>:q<CR>" {}]
                 ;; Remove highlighted search
                 [:n :<m-h> :<cmd>nohlsearch<CR> {}]
                 ;; Force refresh
                 [:n :mj "<cmd>:e<CR>" {:desc :Refresh}]
                 ;; Remap jump next
                 [:n :<c-m> :<c-i> {}]])

(each [_ mapping (ipairs mappings)]
  (match mapping
    [mode key cmd desc]
    (vim.api.nvim_set_keymap mode key cmd (vim.tbl_extend :force opts desc))))
