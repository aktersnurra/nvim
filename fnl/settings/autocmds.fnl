;; Autocommands for nvim.

(local cursorline (require :util.cursorline))

(local auto-cmds
       [[:TextYankPost
         {:callback (lambda []
                      (vim.highlight.on_yank {:higroup :Visual :timeout 200}))}]
        [:BufWinEnter {:command "setlocal formatoptions-=cro"}]
        [:FileType {:pattern :qf :command "set nobuflisted"}]
        [:FileType {:pattern [:gitcommit :markdown] :command "setlocal wrap"}]
        [:VimResized {:command "tabdo wincmd ="}]
        [[:FocusGained :BufEnter :CursorHold :CursorHoldI]
         {:command :checktime}]
        [[:InsertLeave :WinEnter] {:callback cursorline.show}]
        [[:InsertEnter :WinLeave] {:callback cursorline.hide}]])

(let [cmds (require :util.cmds)]
  (cmds.create-auto-cmds auto-cmds))
