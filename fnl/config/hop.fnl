;; Hopping in text.
(module config.hop
  {autoload {util util
             nvim aniseed.nvim}})

(let [hop (util.load-plugin :hop)]
  (hop.setup {}))

(nvim.set_keymap :n :s ":HopChar2<cr>" {:silent true})
(nvim.set_keymap :n :S ":HopWord<cr>" {:silent true})
