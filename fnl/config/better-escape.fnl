;; Better escape without nasty delay
(module config.better-escape
  {autoload {util util}})


(let [(ok? better-escape) util.load-plugin :better-escape]
  (when ok?
    (better-escape.setup {
      :mapping ["jk" "jj"]
      :timeout vim.o.timeoutlen
      :clear_empty_lines false
      :keys "<Esc>"}})))
