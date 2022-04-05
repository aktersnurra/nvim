;; Zen mode.
(module config.zen-mode
  {autoload {util util}})

(let [(ok? zen-mode) util.load-plugin :zen-mode]
  (when ok?
    (zen-mode.setup 
      {:window {
        :backdrop 1
        :height 1
        :width 120
        :options {
          :signcolumn "no"
          :number false
          :relativenumber false}}
       :plugins {
         :gitsigns { :enabled false }
         :tmux { :enabled true }
         :twilight { :enabled true }}})))
