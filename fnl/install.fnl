;; Installs plugins with packer.
(module install
  {autoload {
    a aniseed.core
    plugins plugins
    packer packer}})

(defn- install-plugins [...]
  (each [plugin opts (pairs [...])]
    (packer.startup (
      fn [use]
      (use (a.assoc opts 1 plugin))))))

(install-plugins plugins)
