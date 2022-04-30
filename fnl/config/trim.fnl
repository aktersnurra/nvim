;; Trim whitespaces on save.
(module config.trim
  {autoload {util util}})

(let [trim (util.load-plugin :trim)]
  (trim.setup {}))
