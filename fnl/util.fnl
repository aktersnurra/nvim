;; Utility functions.
(module util {autoload {a aniseed.core nvim aniseed.nvim : packer}})

(def- path (.. (vim.fn.stdpath :data) :/site/pack/packer/start))

(def- installed-plugins (vim.fn.readdir path))

(def- configured-plugins (require :plugins))

(defn- parse-plugins-names [plugins] (var names [])
       (each [plugin _ (pairs plugins)]
         (table.insert names (string.match plugin "/(.*)"))) names)

(defn- contains [ys xs] (var equal true)
       (each [_ x (pairs xs)]
         (if (not= (vim.tbl_contains ys x) true)
             (set equal false))) equal)

(defn- deep-equal [xs ys] (and (contains xs ys) (contains ys xs)))

(defn- synchronized [configured installed]
       (and (= (vim.tbl_count configured) (vim.tbl_count installed))
            (deep-equal configured installed)))

(defn- install []
       (packer.startup (fn [use]
                         (each [plugin opts (pairs configured-plugins)]
                           (use (a.assoc opts 1 plugin))))))

(defn load-plugins [] (install)
      (if (not= (synchronized (parse-plugins-names configured-plugins)
                              installed-plugins) true)
          (packer.sync)
          (require :config)))

(defn load-plugin [name]
      (let [(ok? plugin) (pcall require name)]
        (if ok?
            plugin
            (vim.notify (.. "Could not load config: " val-or-err)
                        vim.log.levels.WARN))))

(defn use-config [plugin config]
      (let [plugin (load-plugin plugin)]
        (plugin.setup config)))
