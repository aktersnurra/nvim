;; Zen mode.

{1 :folke/zen-mode.nvim
 :cmd :ZenMode
 :keys [{1 :<leader>z 2 :<cmd>ZenMode<cr> :desc "Zen Mode"}]
 :opts {:window {:backdrop 1
                 :height 1
                 :width 120
                 :options {:signcolumn :no :number false :relativenumber false}}
        :plugins {:gitsigns {:enabled false}
                  :tmux {:enabled true}
                  :twilight {:enabled true}}}}
