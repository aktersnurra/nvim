;; Load file with function

(λ apply-to-files [path f]
  (each [fname type (vim.fs.dir (.. (vim.fn.stdpath :config) path))]
    (when (= type :file)
      (f (fname:match "^(.*)%.fnl$")))))

{: apply-to-files}
