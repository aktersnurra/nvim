;; Zen mode.

(local opts {:window {:backdrop 1
                      :height 1
                      :width 120
                      :options {:signcolumn :no
                                :number false
                                :relativenumber false}}
             :plugins {:gitsigns {:enabled false}
                       :tmux {:enabled true}
                       :twilight {:enabled true}}})

(local keys [{1 :<leader>/ 2 :<cmd>ZenMode<cr> :desc "Zen Mode"}])

{1 :folke/zen-mode.nvim :cmd :ZenMode : keys : opts}
