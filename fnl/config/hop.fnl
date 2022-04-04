;; Hopping in text.
(module config.hop
  {autoload {util util
             nvim aniseed.nvim}})

(let [(ok? hop) util.load-plugin :hop]
  (when ok?
    (hop.setup {})))

(nvim.set_keymap "n" "s" ":HopChar2<cr>" { :silent true })
(nvim.set_keymap "n" "S" ":HopWord<cr>" { :silent true })
