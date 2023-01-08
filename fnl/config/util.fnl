;; Utility functions.
(module util {autoload {a aniseed.core nvim aniseed.nvim}})

(defn telescope-ext [ext fun opts]
      (let [telescope (require :telescope)
            themes (require :telescope.themes)
            theme (. opts :theme)]
        ((. (. (. telescope :extensions) ext) fun) ((. themes theme) opts))))

(defn telescope-builtin [builtin opts]
      (let [telescope (require :telescope.builtin)
            themes (require :telescope.themes)
            theme (. opts :theme)]
        ((. telescope builtin) ((. themes theme) opts))))

(defn load [plugins]
  (let [configs []]
    (each [_ plugin (pairs plugins)]
      (table.insert configs (require plugin)))
    configs))
