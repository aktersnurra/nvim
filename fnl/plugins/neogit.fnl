;; Git ui.

(local dependencies [:nvim-lua/plenary.nvim])

(local keys [{1 :<leader>gm 2 :<cmd>Neogit<cr> :desc :Neogit}])

(local auto-cmds [[:FileType
                   {:pattern [:NeogitStatus
                              :NeogitCommitMessage
                              :NeogitNotification
                              :NeogitCommitView]
                    :command "setlocal spell!"}]])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-auto-cmds auto-cmds)))

(local opts {:integrations {:diffview true :telescope true}})

{1 :TimUntersberger/neogit :cmd :Neogit : opts : init : dependencies : keys}
