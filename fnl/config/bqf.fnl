;; Make Neovim's quickfix window better.
(module config.bqf {autoload {util util}})

(let [bqf (util.load-plugin :bqf)]
  (bqf.setup {}))
