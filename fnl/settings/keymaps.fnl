;; Custom keymappings.

(import-macros {: keymaps} :macros)

(keymaps
  ;; Resize with arrows
  [:n :<m-f> :<c-w>+ {}]
  [:n :<m-p> :<c-w>- {}]
  [:n "<m-,>" :<c-w>5< {}]
  [:n :<m-.> :<c-w>5> {}]
  ;; Stay in indent mode
  [:v "<" :<gv {}]
  [:v ">" :>gv {}]
  ;; Move text up and down
  [:x :J ":move '>+1<CR>gv-gv" {}]
  [:x :K ":move '<-2<CR>gv-gv" {}]
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
  ;; Jump to eol in insert mode
  [:i :<c-e> :<c-o>$ {}]
  ;; Force refresh
  [:n :mj "<cmd>:e<CR>" {:desc :Refresh}])
