;; Autocommands for nvim.
(module config.autocmd {autoload {nvim aniseed.nvim a aniseed.core util util}})

(defn- autocmd [event opts] (nvim.create_autocmd event opts))

(autocmd :User
         {:pattern :AlphaReady
          :command "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2"})

(autocmd :BufEnter
         {:command "if winnr('$') == 1 && bufname() == 'NvimTree_' . tabpagenr() | quit | endif"})

(autocmd :FileType
         {:pattern [:qf :help :man :lspinfo]
          :command "nnoremap <silent> <buffer> q :close<CR>"})

(autocmd :TextYankPost
         {:callback (lambda []
                      (vim.highlight.on_yank {:timeout 200}))})

(autocmd :BufWinEnter {:command "setlocal formatoptions-=cro"})

(autocmd :FileType {:pattern :qf :command "set nobuflisted"})

(autocmd :FileType {:pattern [:gitcommit :markdown] :command "setlocal wrap"})

(autocmd :FileType {:pattern [:gitcommit :markdown] :command "setlocal spell"})

(autocmd :VimResized {:command "tabdo wincmd ="})
