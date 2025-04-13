;; Zen mode.

(local opts {:window {:backdrop 0.98
                      :height 1
                      :width 120
                      :options {:signcolumn :no
                                :number false
                                :relativenumber false}}
             :plugins {:options {:laststatus 0}
                       :gitsigns {:enabled false}
                       :tmux {:enabled false}
                       :twilight {:enabled true}}})

(local keys [{1 :gy 2 :<cmd>ZenMode<cr> :desc "Zen Mode"}])

{1 :folke/zen-mode.nvim :cmd :ZenMode : keys : opts}
