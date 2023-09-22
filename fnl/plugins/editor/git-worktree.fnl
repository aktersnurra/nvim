;; Plugins for working with git-worktrees.

(local keys [{1 :<leader>wn
              2 "<cmd>lua require('telescope').extensions.git_worktree.git_worktrees()<cr>"
              :mode :n
              :desc "Switch between worktrees"}
             {1 :<leader>we
              2 "<cmd>lua require('telescope').extensions.git_worktree.create_git_worktree()<cr>"
              :mode :n
              :desc "Create a worktree"}])

{1 :ThePrimeagen/git-worktree.nvim : keys}
