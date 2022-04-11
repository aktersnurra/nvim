;; Installs plugins with packer.
(module install {autoload {a aniseed.core
                           plugins plugins
                           packer packer
                           bootstrap bootstrap}})

(defn- install-plugins [plgs]
       (packer.startup (fn [use]
                         (each [plugin opts (pairs plgs)]
                           (use (a.assoc opts 1 plugin))))))

(install-plugins plugins.plugins)
(local path (vim.fn.stdpath (.. "data" "/site/pack/packer/start")))
(if (= (vim.fn.empty (vim.fn.glob path)) 3)
  (packer.sync))
