;; Custom keymappings.

(local opts {:noremap true :silent true})
(fn map [mode lhs rhs opt] (vim.api.nvim_set_keymap mode lhs rhs opt))

;;Remap space as leader key
(map "" :<Space> :<Nop> opts)

;; Normal ;;
;; Better window navigation
(map :n :<C-h> :<C-w>h opts)
(map :n :<C-j> :<C-w>j opts)
(map :n :<C-k> :<C-w>k opts)
(map :n :<C-l> :<C-w>l opts)

;; Resize with arrows
(map :n :<C-Up> ":resize -2<CR>" opts)
(map :n :<C-Down> ":resize +2<CR>" opts)
(map :n :<C-Left> ":vertical resize -2<CR>" opts)
(map :n :<C-Right> ":vertical resize +2<CR>" opts)

;; Visual ;;
;; Stay in indent mode
(map :v "<" :<gv opts)
(map :v ">" :>gv opts)

;; Visual Block ;;
;; Move text up and down
(map :x :J ":move '>+1<CR>gv-gv" opts)
(map :x :K ":move '<-2<CR>gv-gv" opts)

;; Move text up and down
(map :v :<m-j> ":m .+1<CR>==" opts)
(map :v :<m-k> ":m .-2<CR>==" opts)
(map :v :p "\"_dP" opts)

;; Splits
(map :n :<m-s> :<cmd>split<CR> opts)
(map :n :<m-t> :<cmd>vsplit<CR> opts)

;; Nav
(map :n :<m-m> :<cmd>bprev<CR> opts)
(map :n :<m-i> :<cmd>bnext<CR> opts)

(map :n :<c-d> :<c-d>zz opts)
(map :n :<c-u> :<c-u>zz opts)

(map :n :<m-n> :<cmd>nohlsearch<CR> opts)

(map :n :Q "<cmd>:q<CR>" opts)
(map :n :mj "<cmd>:e<CR>" opts)
