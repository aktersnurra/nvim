;; Functions for showing and hiding the cursorline.

(local ignore-filetypes [:neo-tree])

(fn filetype []
  vim.bo.filetype)

(fn ignore []
  (vim.tbl_contains ignore-filetypes (filetype)))

(fn show []
  (let [(ok cl) (pcall vim.api.nvim_win_get_var 0 :auto-cursorline)]
    (if (and ok cl)
        (do
          (set vim.wo.cursorline true)
          (vim.api.nvim_win_del_var 0 :auto-cursorline)))))

(fn hide []
  (if (not= (ignore) true)
      (do
        (let [cl vim.wo.cursorline]
          (if cl
              (do
                (vim.api.nvim_win_set_var 0 :auto-cursorline cl)
                (set vim.wo.cursorline false)))))))

{: show : hide}
