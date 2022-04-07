;; Custom keymappings.
(module settings.keymaps
  {autoload {nvim aniseed.nvim}})

(def- opts {:noremap true :silent true})
(defn- map [mode lhs rhs opt]
  (nvim.set_keymap mode lhs rhs opt))

;;Remap space as leader key
(map "" "<Space>" "<Nop>" opts)
(set nvim.g.mapleader " ")
(set nvim.g.maplocalleader " ")

;; Modes
;;   normal_mode = "n"
;;   insert_mode = "i"
;;   visual_mode = "v"
;;   visual_block_mode = "x"
;;   term_mode = "t"
;;   command_mode = "c"

;; Normal ;;
;; Better window navigation
(map "n" "<C-h>" "<C-w>h" opts)
(map "n" "<C-j>" "<C-w>j" opts)
(map "n" "<C-k>" "<C-w>k" opts)
(map "n" "<C-l>" "<C-w>l" opts)


;; Resize with arrows
(map "n" "<C-Up>" ":resize -2<CR>" opts)
(map "n" "<C-Down>" ":resize +2<CR>" opts)
(map "n" "<C-Left>" ":vertical resize -2<CR>" opts)
(map "n" "<C-Right>" ":vertical resize +2<CR>" opts)

;; Navigate buffers
(map "n" "<S-l>" ":bnext<CR>" opts)
(map "n" "<S-h>" ":bprevious<CR>" opts)

;; Visual ;;
;; Stay in indent mode
(map "v" "<" "<gv" opts)
(map "v" ">" ">gv" opts)

;; Visual Block ;;
;; Move text up and down
(map "x" "J" ":move '>+1<CR>gv-gv" opts)
(map "x" "K" ":move '<-2<CR>gv-gv" opts)
(map "x" "<A-j>" ":move '>+1<CR>gv-gv" opts)
(map "x" "<A-k>" ":move '<-2<CR>gv-gv" opts)

;; Move text up and down
(map "v" "<A-j>" ":m .+1<CR>==" opts)
(map "v" "<A-k>" ":m .-2<CR>==" opts)
(map "v" "p" "\"_dP" opts)
