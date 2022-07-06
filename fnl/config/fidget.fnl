;; Show lsp progress.
(module config.fidget {autoload {util util}})

(let [fidget (util.load-plugin :fidget)]
  (fidget.setup {}))
