;; Load all plugins.

(let [plugins []
      path (.. (vim.fn.stdpath :config) :/fnl/plugins)]
  (each [fname (vim.fs.dir path)]
    (let [fname (fname:match "^(.*)%.fnl$")]
      (if (and (not= fname nil) (not= fname :init))
          (table.insert plugins (require (.. :plugins. fname))))))
  (table.insert plugins (require :plugins.lsp))
  plugins)
