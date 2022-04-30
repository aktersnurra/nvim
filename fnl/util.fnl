;; Utility functions.
(module util
  {autoload {a       aniseed.core
             nvim    aniseed.nvim
             packer  packer
             plugins plugins}})

(def- path (.. (vim.fn.stdpath :data) :/site/pack/packer/start))

(def num-plugins (length (vim.fn.readdir path)))

(defn sync []
  (if (= num-plugins 3)
      (packer.sync)))

(defn install []
  (packer.startup (fn [use]
    (each [plugin opts (pairs plugins.plugins)]
      (use (a.assoc opts 1 plugin))))))

(defn load-config []
  (if (> num-plugins 3)
    (require :config)))

(defn load-plugin [name]
  (let [(ok? val-or-err) (pcall require name)]
    (if ok?
      val-or-err
      (vim.notify
        (.. "Could not load config: " val-or-err)
        vim.log.levels.WARN))))
