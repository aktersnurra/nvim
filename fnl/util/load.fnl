;; Load file with function

(λ load-and-apply [path f]
  (each [fname type (vim.fs.dir (.. (vim.fn.stdpath :config) path))]
    (when (= type :file)
      (f (fname:match "^(.*)%.fnl$")))))

{: load-and-apply}
