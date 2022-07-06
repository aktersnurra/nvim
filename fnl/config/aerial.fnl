;; Skimming code.
(module config.aerial {autoload {util util}})

(let [aerial (util.load-plugin :aerial)]
  (aerial.setup {}))
