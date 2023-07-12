;; Inspect commits.

{1 :sindrets/diffview.nvim
 :cmd [:DiffviewFileHistory :DiffviewOpen]
 :config true
 :keys [{1 :md 2 :<cmd>DiffviewFileHistory<cr> :desc :DiffviewFileHistory}
        {1 :mx 2 "<cmd>DiffviewOpen -uno<cr>" :desc :DiffviewOpen}
        {1 :mz 2 :<cmd>DiffviewClose<cr> :desc :DiffviewClose}]}
