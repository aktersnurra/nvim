;; Installs plugins with packer.
(module install {autoload {a aniseed.core
                           plugins plugins
                           packer packer
                           bootstrap bootstrap}})

(defn- install-plugins [plgs]
       (packer.startup (fn [use]
                         (each [plugin opts (pairs plgs)]
                           (use (a.assoc opts 1 plugin)))))
       (if is_bootstrapped?
           ((require :config.packer) .sync)))

(local is_bootstrapped (bootstrap.run))
(install-plugins plugins.plugins)
