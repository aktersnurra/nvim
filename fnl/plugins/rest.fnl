;; Http client.

(local keybinds [[:<localleader>rr
                  "<cmd>Rest run<cr>"
                  "Run request under the cursor"]
                 [:<localleader>rs
                  "<cmd>Rest run last<cr>"
                  "Re-run last request"]
                 [:<localleader>rt
                  "<cmd>Telescope rest select_env theme=dropdown<cr>"
                  "Select env"]])

{1 :rest-nvim/rest.nvim
 :ft :http
 :dependencies [{1 :vhyrro/luarocks.nvim :priority 1000 :config true}]
 :config (lambda []
           (let [rest-nvim (require :rest-nvim)]
             (rest-nvim.setup {: keybinds})))}
