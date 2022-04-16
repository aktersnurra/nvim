;; Installs plugins with packer.
(module install {autoload {a aniseed.core
                           plugins plugins
                           packer packer
                           util util}})

(defn- install-plugins [plgs]
       (packer.startup (fn [use]
                         (each [plugin opts (pairs plgs)]
                           (use (a.assoc opts 1 plugin))))))

(install-plugins plugins.plugins)
(if (= util.num-plugins 3)
    (packer.sync))
