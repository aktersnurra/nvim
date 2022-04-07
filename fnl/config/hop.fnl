;; Hopping in text.
(module config.hop
  {autoload {util util
             nvim aniseed.nvim}})

(set nvim.set_keymap "n" "s" ":HopChar2<cr>" { :silent true })
(set nvim.set_keymap "n" "S" ":HopWord<cr>" { :silent true })

(let [hop (util.load-plugin :hop)]
  (hop.setup {}))
