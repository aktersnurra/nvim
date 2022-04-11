;; Installs plugins with packer.
(module install {autoload {a aniseed.core
                           plugins plugins
                           packer packer
                           bootstrap bootstrap}})

(defn- install-plugins [plgs]
       (packer.startup (fn [use]
                         (each [plugin opts (pairs plgs)]
                           (use (a.assoc opts 1 plugin)))))
      (if (vim.env.BOOTSTRAPPED)?
        (packer.sync)))

(install-plugins plugins.plugins)
