;; Inspect commits.

{1 :sindrets/diffview.nvim
 :cmd [:DiffviewFileHistory :DiffviewOpen]
 :config true
 :keys [{1 :<leader>gh 2 :<cmd>DiffviewFileHistory<cr> :desc :DiffviewFileHistory}
        {1 :<leader>go 2 "<cmd>DiffviewOpen -uno<cr>" :desc :DiffviewOpen}
        {1 :<leader>ga 2 :<cmd>DiffviewClose<cr> :desc :DiffviewClose}]}
