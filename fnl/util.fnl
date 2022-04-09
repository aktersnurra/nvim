;; Utility functions.
(module util)

(defn autocmd [name opts]
  (nvim.create_autocmd name opts))

(defn load-plugin [name]
  (let [(ok? val-or-err) (pcall require name)]
    (if ok?
      val-or-err
      (vim.notify (.. "Could not load config: " val-or-err) vim.log.levels.WARN))))
