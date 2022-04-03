;; Enables colorization of color codes in source files.
(module config.colorizer
  {autoload {util util}})

(let [(ok? colorizer) util.load-plugin :colorizer]
  (when ok?
    (colorizer.setup)))

