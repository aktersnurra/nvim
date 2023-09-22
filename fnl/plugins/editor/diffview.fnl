;; Inspect commits.

{1 :sindrets/diffview.nvim
 :cmd [:DiffviewFileHistory :DiffviewOpen]
 :config true
 :keys [{1 :<leader>is
         2 :<cmd>DiffviewFileHistory<cr>
         :desc "Repository history"
         :nowait true}
        {1 :<leader>it
         2 "<cmd>DiffviewFileHistory --follow %<cr>"
         :desc "File history"}
        {1 :<leader>ir 2 :<cmd>DiffviewOpen<cr> :desc :Diffview}
        {1 :<leader>ia
         2 "<cmd>DiffviewOpen master<cr>"
         :desc "Diffview with master"}
        {1 :<leader>if
         2 "<cmd>.DiffviewFileHistory --follow<cr>"
         :desc "Line history"}
        {1 :<leader>ip
         2 "<esc><cmd>'<,'>DiffviewFileHistory --follow<CR>"
         :desc "Range history" :mode :v}
        {1 :<leader>ic 2 :<cmd>DiffviewClose<cr> :desc "Close diffview"}]}
