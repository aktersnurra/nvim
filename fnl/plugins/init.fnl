;; Load all plugins.

(local editor-plugins (let [plugins []
                            path (.. (vim.fn.stdpath :config)
                                     :/fnl/plugins/editor)]
                        (each [fname (vim.fs.dir path)]
                          (let [fname (fname:match "^(.*)%.fnl$")]
                            (table.insert plugins
                                          (require (.. :plugins.editor. fname)))))
                        plugins))

(local plugins (let [plugins editor-plugins]
                 (table.insert plugins (require :plugins.lsp))
                 (table.insert plugins (require :plugins.core.hotpot))
                 plugins))

(let [lazy (require :plugins.core.lazy)]
  (lazy.setup plugins))
