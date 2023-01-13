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
        [:FileType {:pattern :qf :command "set nobuflisted"}]
        [:FileType {:pattern [:gitcommit :markdown] :command "setlocal wrap"}]
        [:FileType
         {:pattern [:NeogitStatus
                    :NeogitCommitMessage
                    :NeogitNotification
                    :NeogitCommitView]
          :command "setlocal spell!"}]
        [:TermOpen
         {:pattern ["term://*toggleterm#*"] :command "setlocal spell!"}]
        [:VimResized {:command "tabdo wincmd ="}]
        [:FocusGained {:command :checktime}]
        [:TermOpen
         {:pattern "term://*toggleterm#*"
          :callback (fn []
                      (vim.keymap.set :t :<C-h> "<Cmd>wincmd h<CR>" {})
                      (vim.keymap.set :t :<C-j> "<Cmd>wincmd j<CR>" {})
                      (vim.keymap.set :t :<C-k> "<Cmd>wincmd k<CR>" {})
                      (vim.keymap.set :t :<C-l> "<Cmd>wincmd l<CR>" {}))}]])

(each [_ autocmd (ipairs autocmds)]
  (match autocmd
    [event opts] (vim.api.nvim_create_autocmd event opts)))
