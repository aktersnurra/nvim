(local keys [{1 :<leader>rr
              2 :<cmd>FreightRun<cr>
              :desc "Run request under cursor"}
             {1 :<leader>ra
              2 :<cmd>FreightRunAll<cr>
              :desc "Run all requests in buffer"}
             {1 :<leader>rh
              2 :<cmd>FreightHistory<cr>
              :desc "Show request history"}
             {1 :<leader>ri
              2 :<cmd>FreightInspect<cr>
              :desc "Inspect request"}
             {1 :<leader>re
              2 :<cmd>FreightEnv<cr>
              :desc "Pick environment file"}
             {1 :<leader>r?
              2 :<cmd>FreightHelp<cr>
              :desc "Show Freight help"}])

{:dir (vim.fn.expand "~/projects/vibe/freight")
 :name :freight
 : keys
 :lazy false}
