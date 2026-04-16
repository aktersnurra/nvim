;; Autocommands for nvim.

(import-macros {: autocmds} :macros)

(autocmds
  [:FileType
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
   {:pattern "*"
    :callback (fn []
                (when (= (vim.fn.mode) :n)
                  (vim.cmd :checktime)))}]
  [[:InsertLeave :WinEnter]
   {:callback (λ []
                (let [cursorline (require :settings.cursorline)]
                  cursorline.show))}]
  [[:InsertEnter :WinLeave]
   {:callback (λ []
                (let [cursorline (require :settings.cursorline)]
                  cursorline.hide))}])
