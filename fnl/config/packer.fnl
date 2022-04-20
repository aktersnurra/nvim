;; Load packer config
(module config.packer {autoload {util util}})

(let [packer (util.load-plugin :packer) packer-util (require :packer.util)]
  (packer.init {:display {:open_fn (fn []
                                     (packer-util.float {:border :rounded}))}}))
