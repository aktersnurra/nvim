;; Provides a set of mappings for enhancing in-buffer search experience.

{1 :junegunn/vim-slash
 :event :BufReadPost
 :config (fn []
           (vim.cmd "noremap <plug>(slash-after) zz"))}
