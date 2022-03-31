;; Installs plugins with packer.
(module install
  {autoload {
    a aniseed.core
    plugins plugins
    packer packer
    nvim aniseed.nvim}})

(defn- use [...]
  (let [plugins [...]]
  (packer.startup
    (fn [use])
)

(defn- override-use [use]
  (fn [plugin opts]
  (use (a.assoc (or opts {}) 1 name))
)

(packer.startup(
  fn use
))
