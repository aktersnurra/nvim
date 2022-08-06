;; Autocommands for nvim.
(module config.autocmd {autoload {nvim aniseed.nvim a aniseed.core : util}})

(defn create-autocmd [event opts] (nvim.create_autocmd event opts))

(create-autocmd :BufEnter
                {:command "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"})

(create-autocmd :FileType
                {:pattern [:qf :help :man :lspinfo]
                 :command "nnoremap <silent> <buffer> q :close<CR>"})

(create-autocmd :TextYankPost
                {:callback (lambda []
                             (vim.highlight.on_yank {:timeout 200}))})

(create-autocmd :BufWinEnter {:command "setlocal formatoptions-=cro"})

(create-autocmd :FileType {:pattern :qf :command "set nobuflisted"})

(create-autocmd :FileType {:pattern :lir
                           :callback (fn []
                                       (tset vim.opt_local :number false)
                                       (tset vim.opt_local :relativenumber
                                             false))})

(create-autocmd :FileType {:pattern [:gitcommit :markdown]
                           :command "setlocal wrap"})

(create-autocmd :FileType {:pattern [:gitcommit :markdown :org :plaintex]
                           :command "setlocal spell"})

(create-autocmd :VimResized {:command "tabdo wincmd ="})
