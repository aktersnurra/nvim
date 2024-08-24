;; Http client.

(local keys [{1 :<leader>rr
              2 "<cmd>Rest run<cr>"
              :desc "Run request under the cursor"}
             {1 :<localleader>rs
              2 "<cmd>Rest run last<cr>"
              :desc "Re-run last request"}
             {1 :<localleader>rt
              2 "<cmd>Telescope rest select_env theme=dropdown<cr>"
              :desc "Select env"}])

{1 :aktersnurra/rest.nvim
 :ft :http
 : keys
 :dev true
 :dependencies [{1 :vhyrro/luarocks.nvim :priority 1000 :config true}
                {1 :j-hui/fidget.nvim}]}
