;; Enables colorization of color codes in source files.
(module config.colorizer
  {autoload {util util}})

(let [colorizer (util.load-plugin :colorizer)]
  (colorizer.setup))
