;; Autocommands for nvim.

(local auto-cmds [[:FileType
                   {:pattern [:qf :help :man :lspinfo]
                    :command "nnoremap <silent> <buffer> q :close<CR>"}]
                  [:TextYankPost
                   {:callback (λ []
                                (vim.highlight.on_yank {:higroup :Visual
                                                        :timeout 200}))}]
                  [:BufWinEnter {:command "setlocal formatoptions-=cro"}]
                  [:FileType {:pattern :qf :command "set nobuflisted"}]
                  [:FileType
                   {:pattern [:gitcommit :markdown] :command "setlocal wrap"}]
                  [:VimResized {:command "tabdo wincmd ="}]
                  [[:FocusGained :BufEnter :CursorHold :CursorHoldI]
                   {:command :checktime}]
                  [[:InsertLeave :WinEnter]
                   {:callback (λ []
                                (let [cursorline (require :settings.cursorline)]
                                  cursorline.show))}]
                  [[:InsertEnter :WinLeave]
                   {:callback (λ []
                                (let [cursorline (require :settings.cursorline)]
                                  cursorline.hide))}]])

(let [{: create-auto-cmds} (require :util.cmds)]
  (create-auto-cmds auto-cmds))
