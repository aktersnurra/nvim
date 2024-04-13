;; Resolve git conflicts.


(local keys [{1 "<leader>gg"
              2 "<cmd>GitConflictRefresh<cr>"
              :desc "Git Conflict Refresh"}])

{1 :akinsho/git-conflict.nvim :event :BufReadPre :version "*" :config true : keys}
