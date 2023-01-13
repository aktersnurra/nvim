;; Load all plugins.

(local plugins (let [plugins (require :plugins.lsp)
                     path (.. (vim.fn.stdpath :config) :/fnl/plugins)]
                 (if (vim.loop.fs_stat path)
                     (do
                       (each [fname (vim.fs.dir path)]
                         (let [fname (fname:match "^(.*)%.fnl$")]
                           (if (and (not= fname nil) (not= fname :init)
                                    (not= fname :lazy))
                               (table.insert plugins
                                             (require (.. :plugins. fname))))))))
                 plugins))

(let [lazy (require :plugins.lazy)]
  (lazy.setup plugins))
