;; Find and replace plugin.
(local auto-cmds
       [[:FileType
         {:pattern [:grug-far]
          :command "nnoremap <silent> <buffer> q :close<CR>"}]
        [:FileType {:pattern [:grug-far] :command "setlocal spell!"}]])

(fn replace [?cword ?file]
  (let [grug (require :grug-far)]
    (var opts {:prefills {}})
    (when ?cword
      (set opts.prefills.search ?cword))
    (when ?file
      (set opts.prefills.flags ?file))
    (grug.grug_far opts)))

(fn visual-replace []
  (let [grug (require :grug-far)]
    (grug.with_visual_selection {:prefills {:flags (vim.fn.expand "%")}})))

(fn config []
  (let [cmds (require :util.cmds)
        grug (require :grug-far)]
    (cmds.create-auto-cmds auto-cmds)
    (grug.setup)))

(local keys [{1 :<m-r> 2 :<cmd>GrugFar<cr> :desc "Find and Replace"}
             {1 :<m-w>
              2 (fn []
                  (replace (vim.fn.expand :<cword>)))
              :desc "Find and replace word under cursor"}
             {1 :<m-x>
              2 (fn []
                  (replace nil (vim.fn.expand "%")))
              :desc "Find and replace in file"}
             {1 :<m-a>
              2 (fn []
                  (replace (vim.fn.expand :<cword>) (vim.fn.expand "%")))
              :desc "Find and replace cword in file"}
             {1 :<m-r>
              2 (fn []
                  (visual-replace))
              :desc "Find and Replace"
              :mode [:v]}])

{1 :MagicDuck/grug-far.nvim : keys : config}
