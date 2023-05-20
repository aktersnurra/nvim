;; Autocommands for nvim.
(local autocmds
       [[:FileType
         {:pattern [:qf :help :man :lspinfo :spectre_panel]
          :command "nnoremap <silent> <buffer> q :close<CR>"}]
        [:TextYankPost
         {:callback (lambda []
                      (vim.highlight.on_yank {:higroup :Visual :timeout 200}))}]
        [:FileType
         {:pattern :lir
          :callback (fn []
                      (tset vim.opt_local :number false)
                      (tset vim.opt_local :relativenumber false))}]
        [:BufWinEnter {:command "setlocal formatoptions-=cro"}]
        [:FileType
         {:pattern :org
          :callback (fn []
                      (tset vim.opt_local :conceallevel 2)
                      (tset vim.opt_local :concealcursor :nc))}]
        [:FileType {:pattern :qf :command "set nobuflisted"}]
        [:FileType {:pattern [:gitcommit :markdown] :command "setlocal wrap"}]
        [:FileType
         {:pattern [:NeogitStatus
                    :NeogitCommitMessage
                    :NeogitNotification
                    :NeogitCommitView
                    :spectre_panel]
          :command "setlocal spell!"}]
        [:TermOpen
         {:pattern ["term://*toggleterm#*"] :command "setlocal spell!"}]
        [:VimResized {:command "tabdo wincmd ="}]
        [[:FocusGained :BufEnter :CursorHold :CursorHoldI]
         {:command :checktime}]
        [:TermOpen
         {:pattern "term://*toggleterm#*"
          :callback (fn []
                      (vim.keymap.set :t :<C-h> "<Cmd>wincmd h<CR>" {})
                      (vim.keymap.set :t :<C-j> "<Cmd>wincmd j<CR>" {})
                      (vim.keymap.set :t :<C-k> "<Cmd>wincmd k<CR>" {})
                      (vim.keymap.set :t :<C-l> "<Cmd>wincmd l<CR>" {}))}]
        [[:InsertLeave :WinEnter]
         {:callback (fn []
                      (let [(ok cl) (pcall vim.api.nvim_win_get_var 0
                                           :auto-cursorline)]
                        (if (and ok cl)
                            (do
                              (set vim.wo.cursorline true)
                              (vim.api.nvim_win_del_var 0 :auto-cursorline)))))}]
        [[:InsertEnter :WinLeave]
         {:callback (fn []
                      (let [cl vim.wo.cursorline]
                        (if cl
                            (do
                              (vim.api.nvim_win_set_var 0 :auto-cursorline cl)
                              (set vim.wo.cursorline false)))))}]])

(each [_ autocmd (ipairs autocmds)]
  (match autocmd
    [event opts] (vim.api.nvim_create_autocmd event opts)))
