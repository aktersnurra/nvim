;; A customizable greeter.
(module config.autocmd
  {autoload {nvim aniseed.nvim
             a    aniseed.core
             util util}})

(defn- group [name]
  (nvim.create_augroup name {:clear true}))

(defn- autocmd [event opts name]
  (nvim.create_autocmd event (a.merge! {:group (group name)} opts)))

(autocmd :FileType
         {:pattern [:qf :help :man :lspinfo]
          :command "nnoremap <silent> <buffer> q :close<CR>"}
         :_general_settings)

(autocmd :TextYankPost
         {:callback (lambda [] (vim.highlight.on_yank {:timeout 200}))}
         :_general_settings)

(autocmd :BufWinEnter
         {:command "setlocal formatoptions-=cro"}
         :_general_settings)

(autocmd :FileType
         {:pattern "qf"
          :command "set nobuflisted"}
         :_general_settings)

(autocmd :FileType
         {:pattern "gitcommit"
          :command "setlocal wrap"}
         :_git)

(autocmd :FileType
         {:pattern "gitcommit"
          :command "setlocal spell"}
         :_git)

(autocmd :FileType
         {:pattern "markdown"
          :command "setlocal wrap"}
         :_markdown)

(autocmd :FileType
         {:pattern "markdown"
          :command "setlocal spell"}
         :_markdown)

(autocmd :FileType
         {:pattern "markdown"
          :command "setlocal spell"}
         :_markdown)

(autocmd :VimResized
         {:command "tabdo wincmd ="}
         :_auto_resize)

(autocmd "User AlphaReady"
         {:command "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2"}
         :_alpha)
