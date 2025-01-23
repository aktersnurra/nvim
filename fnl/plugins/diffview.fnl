;; Inspect commits.

(local keys
       [{1 :<leader>dh
         2 :<cmd>DiffviewFileHistory<cr>
         :desc "Repository history"
         :nowait true}
        {1 :<leader>df
         2 "<cmd>DiffviewFileHistory --follow %<cr>"
         :desc "File history"}
        {1 :<leader>do 2 :<cmd>DiffviewOpen<cr> :desc :Diffview}
        {1 :<leader>dm
         2 "<cmd>DiffviewOpen master<cr>"
         :desc "Diffview with master"}
        {1 :<leader>dl
         2 "<cmd>.DiffviewFileHistory --follow<cr>"
         :desc "Line history"}
        {1 :<leader>dv
         2 "<esc><cmd>'<,'>DiffviewFileHistory --follow<CR>"
         :desc "Range history"
         :mode :v}
        {1 :<leader>dc 2 :<cmd>DiffviewClose<cr> :desc "Close diffview"}])

{1 :sindrets/diffview.nvim
 :cmd [:DiffviewFileHistory :DiffviewOpen]
 :config true
 : keys}
