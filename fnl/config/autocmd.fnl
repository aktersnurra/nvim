;; Autocommands for nvim.
(module config.autocmd {autoload {nvim aniseed.nvim
                                  env aniseed.env
                                  a aniseed.core
                                  : packer}})

(defn create-autocmd [event opts] (nvim.create_autocmd event opts))

(create-autocmd :FileType
                {:pattern [:qf :help :man :lspinfo]
                 :command "nnoremap <silent> <buffer> q :close<CR>"})

(create-autocmd :TextYankPost
                {:callback (lambda []
                             (vim.highlight.on_yank {:timeout 200}))})

(create-autocmd :BufWinEnter {:command "setlocal formatoptions-=cro"})

(create-autocmd :FileType {:pattern :qf :command "set nobuflisted"})

(create-autocmd :FileType {:pattern [:gitcommit :markdown]
                           :command "setlocal wrap"})

(create-autocmd :FileType
                {:pattern [:NeogitStatus
                           :NeogitCommitMessage
                           :NeogitNotification
                           :NeogitCommitView
                           :ToggleTerm]
                 :command "setlocal spell!"})

(create-autocmd :VimResized {:command "tabdo wincmd ="})

(create-autocmd :BufWritePost
                {:pattern :*.fnl
                 :callback (lambda []
                             (env.init nvim.g.aniseed#env))})

(create-autocmd :BufWritePost
                {:pattern :plugins.fnl
                 :callback (lambda []
                             (env.init nvim.g.aniseed#env)
                             (packer.sync))})
