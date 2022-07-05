(module config.neogit {autoload {util util}})

(let [neogit (util.load-plugin :trim)]
  (neogit.setup {}))
