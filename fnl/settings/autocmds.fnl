;; Autocommands for nvim.

(fn create-autocmd [event opts]
  (vim.api.nvim_create_autocmd event opts))

(create-autocmd :FileType
                {:pattern [:qf :help :man :lspinfo :spectre_panel]
                 :command "nnoremap <silent> <buffer> q :close<CR>"})

(create-autocmd :TextYankPost
                {:callback (lambda []
                             (vim.highlight.on_yank {:higroup :Visual
                                                     :timeout 200}))})

(create-autocmd :FileType {:pattern :lir
                           :callback (fn []
                                       (tset vim.opt_local :number false)
                                       (tset vim.opt_local :relativenumber
                                             false))})

(create-autocmd :BufWinEnter {:command "setlocal formatoptions-=cro"})

(create-autocmd :FileType {:pattern :qf :command "set nobuflisted"})

(create-autocmd :FileType {:pattern [:gitcommit :markdown]
                           :command "setlocal wrap"})

(create-autocmd :FileType
                {:pattern [:NeogitStatus
                           :NeogitCommitMessage
                           :NeogitNotification
                           :NeogitCommitView]
                 :command "setlocal spell!"})

(create-autocmd :TermOpen
                {:pattern ["term://*toggleterm#*"] :command "setlocal spell!"})

(create-autocmd :VimResized {:command "tabdo wincmd ="})

(create-autocmd :FocusGained {:command :checktime})

(create-autocmd :TermOpen
                {:pattern "term://*toggleterm#*"
                 :callback (fn []
                             (vim.keymap.set :t :<C-h> "<Cmd>wincmd h<CR>" {})
                             (vim.keymap.set :t :<C-j> "<Cmd>wincmd j<CR>" {})
                             (vim.keymap.set :t :<C-k> "<Cmd>wincmd k<CR>" {})
                             (vim.keymap.set :t :<C-l> "<Cmd>wincmd l<CR>" {}))})
