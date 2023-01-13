;; Custom keymappings.

(fn map [mode lhs rhs opt]
  (vim.api.nvim_set_keymap mode lhs rhs opt))

(local opts {:noremap true :silent true})

(local mappings [;;Remap space as leader key
                 ["" :<Space> :<Nop>]
                 ;; Normal ;;
                 ;; Better window navigation
                 [:n :<C-h> :<C-w>h]
                 [:n :<C-j> :<C-w>j]
                 [:n :<C-k> :<C-w>k]
                 [:n :<C-l> :<C-w>l]
                 ;; Resize with arrows
                 [:n :<C-Up> ":resize -2<CR>"]
                 [:n :<C-Down> ":resize +2<CR>"]
                 [:n :<C-Left> ":vertical resize -2<CR>"]
                 [:n :<C-Right> ":vertical resize +2<CR>"]
                 ;; Visual ;;
                 ;; Stay in indent mode
                 [:v "<" :<gv]
                 [:v ">" :>gv]
                 ;; Visual Block ;;
                 ;; Move text up and down
                 [:x :J ":move '>+1<CR>gv-gv"]
                 [:x :K ":move '<-2<CR>gv-gv"]
                 ;; Move text up and down
                 [:v :<m-j> ":m .+1<CR>=="]
                 [:v :<m-k> ":m .-2<CR>=="]
                 [:v :p "\"_dP"]
                 ;; Splits
                 [:n :<m-s> :<cmd>split<CR>]
                 [:n :<m-t> :<cmd>vsplit<CR>]
                 ;; Buf navigation
                 [:n :<m-m> :<cmd>bprev<CR>]
                 [:n :<m-i> :<cmd>bnext<CR>]
                 ;; Jump half a page and centralize the view 
                 [:n :<c-d> :<c-d>zz]
                 [:n :<c-u> :<c-u>zz]
                 ;; Remove highlighted search
                 [:n :<m-n> :<cmd>nohlsearch<CR>]
                 ;; Close window
                 [:n :Q "<cmd>:q<CR>"]
                 ;; Force refresh
                 [:n :mj "<cmd>:e<CR>"]])

(each [_ mapping (ipairs mappings)]
  (match mapping
    [mode key cmd] (map mode key cmd opts)))
