(module config.minibar {autoload {: util}})

(def- opts {:ignore-filetypes [:help
                               :startify
                               :dashboard
                               :packer
                               :neogitstatus
                               :NvimTree
                               :Trouble
                               :alpha
                               :lir
                               :org
                               :Outline
                               :NeogitStatus
                               :NeogitCommitMessage
                               :NeogitNotification
                               :NeogitCommitView
                               :spectre_panel]
            :events [:CursorMoved
                     :TermOpen
                     :DirChanged
                     :BufWinEnter
                     :BufFilePost
                     :InsertEnter
                     :BufWritePost
                     ]})

(util.use-config :minibar opts)
