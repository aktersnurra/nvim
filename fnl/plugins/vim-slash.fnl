;; Provides a set of mappings for enhancing in-buffer search experience.

(fn config []
  (vim.cmd "noremap <plug>(slash-after) zz"))

{1 :junegunn/vim-slash :event :BufReadPost : config}
