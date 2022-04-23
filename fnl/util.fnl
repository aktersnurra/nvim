;; Utility functions.
(module util {autoload {nvim aniseed.nvim}})

(def- path (.. (vim.fn.stdpath :data) :/site/pack/packer/start))
(def num-plugins (length (vim.fn.readdir path)))

(defn load-plugin [name]
  (let [(ok? val-or-err) (pcall require name)]
    (if ok?
      val-or-err
      (vim.notify
        (.. "Could not load config: " val-or-err)
        vim.log.levels.WARN))))
