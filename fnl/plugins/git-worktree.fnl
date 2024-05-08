;; Plugins for working with git-worktrees.

(local keys [{1 :<leader>we
              2 "<cmd>Telescope git_worktree git_worktrees theme=dropdown<cr>"
              :mode :n
              :desc "Switch between worktrees"}
             {1 :<leader>wn
              2 "<cmd>Telescope git_worktree create_git_worktree theme=dropdown<cr>"
              :mode :n
              :desc "Create a worktree"}])

{1 :aktersnurra/git-worktree.nvim : keys}
