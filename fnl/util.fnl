;; Utility functions.
(module util {autoload {a aniseed.core
                        nvim aniseed.nvim
                        packer packer
                        plugins plugins}})

(def- path (.. (vim.fn.stdpath :data) :/site/pack/packer/start))

(defn- num-plugins [] (var i 0)
       (each [_ _ (pairs plugins.plugins)]
         (set i (+ i 1))) i)

(defn- num-installed-plugins [] (length (vim.fn.readdir path)))

(defn- install []
       (packer.startup (fn [use]
                         (each [plugin opts (pairs plugins.plugins)]
                           (use (a.assoc opts 1 plugin))))))

(defn load-plugins [] (install)
      (let [num-installed-plugins (num-installed-plugins)
            num-plugins (num-plugins)]
        (if (= num-installed-plugins num-plugins)
            (require :config)
            (packer.sync))))

(defn load-plugin [name]
      (let [(ok? val-or-err) (pcall require name)]
        (if ok?
            val-or-err
            (vim.notify (.. "Could not load config: " val-or-err)
                        vim.log.levels.WARN))))
