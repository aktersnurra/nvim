;; Utility functions.
(module util {autoload {a aniseed.core
                        nvim aniseed.nvim
                        packer packer
                        plugins plugins}})

(var num-plugins 0)

(def- path (.. (vim.fn.stdpath :data) :/site/pack/packer/start))

(defn- num-installed-plugins [] (length (vim.fn.readdir path)))

(defn sync [] (let [num-installed-plugins (num-installed-plugins)]
                (if (not= num-installed-plugins num-plugins)
                    (packer.sync))))

(defn install []
      (packer.startup (fn [use]
                        (each [plugin opts (pairs plugins.plugins)]
                          (set num-plugins (+ num-plugins 1))
                          (use (a.assoc opts 1 plugin))))))

(defn load-config [] (let [num-installed-plugins (num-installed-plugins)]
                       (if (= num-installed-plugins num-plugins)
                           (require :config))))

(defn load-plugin [name]
      (let [(ok? val-or-err) (pcall require name)]
        (if ok?
            val-or-err
            (vim.notify (.. "Could not load config: " val-or-err)
                        vim.log.levels.WARN))))
