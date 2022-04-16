;; A customizable greeter.
(module config.autocmd {autoload {nvim aniseed.nvim util util}})

(defn autocmd [group cmds] (nvim.command (.. "augroup " group))
      (nvim.command :autocmd!)
      (each [_ cmd (ipairs cmds)]
        (nvim.command (.. "autocmd " cmd))) (nvim.command "augroup end"))

(def- general-settings ["FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR>"
                        "TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Search', timeout = 200})"
                        "BufWinEnter * :set formatoptions-=cro"
                        "FileType qf set nobuflisted"])

(def- git ["FileType gitcommit setlocal wrap"
           "FileType gitcommit setlocal spell"])

(def- markdown ["FileType markdown setlocal wrap"
                "FileType markdown setlocal spell"])

(def- auto-resize ["VimResized * tabdo wincmd ="])

(def- alpha
      ["User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2"])

(autocmd :_general_settings general-settings)
(autocmd :_git git)
(autocmd :_markdown markdown)
(autocmd :_auto_resize auto-resize)
(autocmd :_alpha alpha)
(autocmd :packer_user_config packer)
