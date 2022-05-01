;; Zen mode.
(module config.zen {autoload {util util}})

(let [zen-mode (util.load-plugin :zen-mode)]
  (zen-mode.setup {:window {:backdrop 1
                            :height 0.8
                            :width 0.5
                            :options {:signcolumn :no
                                      :number false
                                      :relativenumber false}}
                   :plugins {:gitsigns {:enabled false}
                             :tmux {:enabled true}
                             :twilight {:enabled true}}}))
