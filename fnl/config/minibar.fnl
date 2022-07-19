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
                               :Outline
                               :NeogitStatus
                               :NeogitCommitMessage
                               :NeogitNotification
                               :NeogitCommitView
                               :spectre_panel]
            :events [:CursorMoved
                     :CursorHold
                     :BufWinEnter
                     :BufFilePost
                     :InsertEnter
                     :BufWritePost
                     :TabClosed]})

(util.use-config :minibar opts)
