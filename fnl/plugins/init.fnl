;; Load all plugins.

(fn get-plugins [...]
  (let [plugins []
        path (.. (vim.fn.stdpath :config) :/fnl/plugins)]
    (each [_ m (ipairs [...])]
      (let [module-path (.. path "/" m)]
        (if (vim.loop.fs_stat module-path)
            (do
              (if (= :lsp m)
                  (table.insert plugins (require (.. :plugins. m)))
                  (each [fname (vim.fs.dir module-path)]
                    (let [fname (fname:match "^(.*)%.fnl$")]
                      (table.insert plugins
                                    (require (.. :plugins. m "." fname))))))))))
    (vim.tbl_flatten plugins)
    plugins))

(let [lazy (require :plugins.core.lazy)
      plugins (get-plugins :compiler :editor :lsp :tools :ui)]
  (lazy.setup plugins))
