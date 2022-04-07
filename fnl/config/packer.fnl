;; Load packer config
(module config.packer
  {autoload {util util}})

(let [packer (util.load-plugin :packer)]
  (packer.init {
    :display {
      :open_fn (fn [] 
        ((require :packer.util).float {:border :rounded}))}}))
