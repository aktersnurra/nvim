;; A customizable greeter.
(module config.autocmd
  {autoload {util util
             nvim aniseed.nvim
             a aniseed.core}})

(def- group (nvim.create_autogroup :K {:clear true}))

(defn- autocmd [name opts]
  (nvim.create_autocmd name (a.merge! {:group group} opts))

(autocmd :FileType 
         {:pattern [ :qf :help :man :lspinfo ] 
          :command "nnoremap <silent> <buffer> q :close<CR>"
          :group :_general_settings})

(autocmd :TextYankPost 
         {:pattern [ :* ] 
          :command "silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200}"
          :group :_general_settings})

(autocmd :BufWinEnter 
         {:pattern [ :* ] 
          :command ":set formatoptions-=cro"
          :group :_general_settings})

(autocmd :FileType 
         {:pattern [ :qf ] 
          :command "set nobuflisted"
          :group :_general_settings})

(autocmd :FileType 
         {:pattern [ :gitcommit ] 
          :command "setlocal wrap"
          :group :_git})

(autocmd :FileType 
         {:pattern [ :gitcommit ] 
          :command "setlocal spell"
          :group :_git})

(autocmd :FileType 
         {:pattern [ :markdown ] 
          :command "setlocal wrap"
          :group :_markdown})

(autocmd :FileType 
         {:pattern [ :markdown  ] 
          :command "setlocal spell"
          :group :_markdown})

(autocmd :VimResized 
         {:pattern [ :*  ] 
          :command "tabdo wincmd ="
          :group :_auto_resize})

(autocmd :User 
         {:pattern [ :AlphaReady  ] 
          :command "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2"
          :group :_alpha})

(autocmd :BufWritePost 
         {:pattern [ :plugins.fnl  ] 
          :command "source <afile> | PackerSync"
          :group :packer_user_config})
