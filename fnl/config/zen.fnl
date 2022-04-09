;; Zen mode.
(module config.zen
  {autoload {util util}})

(let [zen-mode (util.load-plugin :zen-mode)]
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
       :twilight { :enabled true }}}))
