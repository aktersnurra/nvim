;; GitHub PR and issue management.

{1 :pwntester/octo.nvim
 :dependencies [:nvim-lua/plenary.nvim
                :nvim-telescope/telescope.nvim
                :nvim-tree/nvim-web-devicons]
 :cmd :Octo
 :keys [{1 :<leader>Ol 2 "<cmd>Octo pr list<cr>" :desc "List PRs"}
        {1 :<leader>Os 2 "<cmd>Octo review start<cr>" :desc "Review Start"}
        {1 :<leader>Or 2 "<cmd>Octo review resume<cr>" :desc "Review Resume"}
        {1 :<leader>Od 2 "<cmd>Octo review discard<cr>" :desc "Review Discard"}
        {1 :<leader>Om 2 "<cmd>Octo review submit<cr>" :desc "Review Submit"}
        {1 :<leader>Oc 2 "<cmd>Octo review comments<cr>" :desc "Review Comments"}
        {1 :<leader>Oi 2 "<cmd>Octo issue list<cr>" :desc "List Issues"}]
 :opts {}}
