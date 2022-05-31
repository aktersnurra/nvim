;; Hopping in text.
(module config.lightspeed {autoload {util util nvim aniseed.nvim}})

(let [lightspeed (util.load-plugin :lightspeed)]
  (lightspeed.setup {}))
