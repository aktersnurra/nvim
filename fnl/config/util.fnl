;; Utility functions.
(module util {autoload {a aniseed.core nvim aniseed.nvim}})

(defn prequire [name]
      (let [(ok? plugin) (pcall require name)]
        (if ok?
            plugin
            (vim.notify (.. "Could not load config: " plugin)
                        vim.log.levels.WARN))))

(defn setup [plugin config]
      (let [plugin (prequire plugin)]
        (plugin.setup config)))
