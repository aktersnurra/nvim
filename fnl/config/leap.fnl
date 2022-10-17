;; Leap through text.
(module config.leap {autoload {util config.util nvim aniseed.nvim}})

(def- opts {})

(let [leap (util.prequire :leap)]
      (leap.setup opts)
      (leap.set_default_keymaps))
