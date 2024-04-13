;; Resolve git conflicts.

(local keys [{1 :<leader>gi
              2 :<cmd>GitConflictListQf<cr>
              :desc "Git Conflict Quick Fix"}
             {1 :<leader>gg
              2 :<cmd>GitConflictRefresh<cr>
              :desc "Git Conflict Refresh"}])

{1 :akinsho/git-conflict.nvim
 :event :VeryLazy
 :version "*"
 :config true
 : keys}
