;; Trim whitespaces on save.
(module config.trim {autoload {util util}})

(let [trim (util.load-plugin :trim)]
  (trim.setup {
  :disable []
  :patterns [
    "%s/\s\+$//e"
    "%s/\($\n\s*\)\+\%$//"
    "%s/\%^\n\+//"
    "%s/\(\n\n\)\n\+/\1/"
  ]
}))
