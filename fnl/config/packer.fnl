;; Load packer config
(module config.packer
  {autoload {util util}})

(let [(ok? packer) util.load-plugin :packer]
  (when ok?
    (packer.init {
      :display {
          :open_fn (fn [] ((require :packer.util).float {:border :rounded}))}})))
