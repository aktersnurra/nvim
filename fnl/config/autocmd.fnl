;; A customizable greeter.
(module config.autocmd {autoload {util util}})

(util.autocmd :FileType {:pattern [:qf :help :man :lspinfo]
                         :command "nnoremap <silent> <buffer> q :close<CR>"
                         :group :_general_settings})

(util.autocmd :TextYankPost
              {:pattern ["*"]
               :callback (lambda []
                           (vim.highlight.on_yank {:timeout 200}))
               :group :_general_settings})

(util.autocmd :BufWinEnter
              {:pattern ["*"]
               :command ":set formatoptions-=cro"
               :group :_general_settings})

(util.autocmd :FileType {:pattern [:qf]
                         :command "set nobuflisted"
                         :group :_general_settings})

(util.autocmd :FileType {:pattern [:gitcommit]
                         :command "setlocal wrap"
                         :group :_git})

(util.autocmd :FileType {:pattern [:gitcommit]
                         :command "setlocal spell"
                         :group :_git})

(util.autocmd :FileType {:pattern [:markdown]
                         :command "setlocal wrap"
                         :group :_markdown})

(util.autocmd :FileType {:pattern [:markdown]
                         :command "setlocal spell"
                         :group :_markdown})

(util.autocmd :VimResized {:pattern ["*"]
                           :command "tabdo wincmd ="
                           :group :_auto_resize})

(util.autocmd :User {:pattern [:AlphaReady]
                     :command "set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2"
                     :group :_alpha})

(util.autocmd :BufWritePost
              {:pattern [:plugins.fnl]
               :command "source <afile> | PackerSync"
               :group :packer_user_config})
