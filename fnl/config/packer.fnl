;; Load packer config
(module config.packer {autoload {util config.util}})

(let [packer (util.prequire :packer)
      packer-util (require :packer.util)]
  (packer.init {:display {:open_fn (fn []
                                     (packer-util.float {:border :rounded}))}}))
