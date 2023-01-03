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

(defn telescope-ext [ext fun opts]
      (let [telescope (prequire :telescope)
            themes (prequire :telescope.themes)
            theme (. opts :theme)]
        ((. (. (. telescope :extensions) ext) fun) ((. themes theme) opts))))

(defn telescope-builtin [builtin opts]
      (let [telescope (prequire :telescope.builtin)
            themes (prequire :telescope.themes)
            theme (. opts :theme)]
        ((. telescope builtin) ((. themes theme) opts))))
