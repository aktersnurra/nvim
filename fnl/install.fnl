;; Installs plugins with packer.
(module install
  {autoload {a aniseed.core
             packer packer
             plugins plugins
             util util}})

(defn- sync []
  (if (= util.num-plugins 3)
      (packer.sync)))

(defn- install []
  (packer.startup (fn [use]
    (each [plugin opts (pairs plugins.plugins)]
      (use (a.assoc opts 1 plugin))))))

(install)
(sync)
