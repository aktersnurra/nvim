;; Find and replace plugin.
(local auto-cmds
       [[:FileType
         {:pattern [:grug-far]
          :command "nnoremap <silent> <buffer> q :close<CR>"}]
        [:FileType {:pattern [:grug-far] :command "setlocal spell!"}]])

(λ replace [?cword ?file]
  (let [grug (require :grug-far)]
    (var opts {:prefills {}})
    (when ?cword
      (set opts.prefills.search ?cword))
    (when ?file
      (set opts.prefills.paths ?file))
    (grug.open opts)))

(λ visual-replace []
  (let [grug (require :grug-far)]
    (grug.with_visual_selection {:prefills {:paths (vim.fn.expand "%")}})))

(λ config []
  (let [{: create-auto-cmds} (require :util.cmds)
        grug (require :grug-far)]
    (create-auto-cmds auto-cmds)
    (grug.setup)))

(local keys [{1 :<m-w> 2 :<cmd>GrugFar<cr> :desc "Find and Replace"}
             {1 :<m-s-w>
              2 (λ []
                  (replace nil (vim.fn.expand "%")))
              :desc "Find and replace in file"}
             {1 :<m-r>
              2 (λ []
                  (replace (vim.fn.expand :<cword>)))
              :desc "Find and replace word under cursor"}
             {1 :<m-r>
              2 (λ []
                  (visual-replace))
              :desc "Find and Replace"
              :mode [:v]}
             {1 :<m-s-r>
              2 (λ []
                  (replace (vim.fn.expand :<cword>) (vim.fn.expand "%")))
              :desc "Find and replace cword in file"}])

{1 :MagicDuck/grug-far.nvim : keys : config}
