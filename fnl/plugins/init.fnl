;; Load all plugins.

(fn get-plugins []
  (let [plugins []
        path (.. (vim.fn.stdpath :config) :/fnl/plugins/editor)]
    (each [fname (vim.fs.dir path)]
      (let [fname (fname:match "^(.*)%.fnl$")]
        (table.insert plugins (require (.. :plugins.editor. fname)))))
    (table.insert plugins (require :plugins.lsp))
    plugins))

(let [_ (require :plugins.core.hotpot)
      lazy (require :plugins.core.lazy)]
  (lazy.setup (get-plugins)))
