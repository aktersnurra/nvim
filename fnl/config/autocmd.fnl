;; Autocommands for nvim.
(module config.autocmd {autoload {nvim aniseed.nvim a aniseed.core : util}})

(util.autocmd :BufEnter
         {:command "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"})

(util.autocmd :FileType
         {:pattern [:qf :help :man :lspinfo]
          :command "nnoremap <silent> <buffer> q :close<CR>"})

(util.autocmd :TextYankPost
         {:callback (lambda []
                      (vim.highlight.on_yank {:timeout 200}))})

(util.autocmd :BufWinEnter {:command "setlocal formatoptions-=cro"})

(util.autocmd :FileType {:pattern :qf :command "set nobuflisted"})

(util.autocmd :FileType
         {:pattern :lir
          :callback (fn []
                      (tset vim.opt_local :number false)
                      (tset vim.opt_local :relativenumber false))})

(util.autocmd :FileType {:pattern [:gitcommit :markdown] :command "setlocal wrap"})

(util.autocmd :FileType {:pattern [:gitcommit :markdown :org :plaintex]
                    :command "setlocal spell"})

(util.autocmd :VimResized {:command "tabdo wincmd ="})
