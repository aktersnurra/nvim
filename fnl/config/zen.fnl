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

{1 :folke/zen-mode.nvim :cmd :ZenMode :config opts}
