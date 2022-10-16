(module config.minibar {autoload {util config.util}})

(def- opts {:ignore-filetypes [:help
                               :startify
                               :harpoon
                               :dashboard
                               :packer
                               :neogitstatus
                               :Trouble
                               :alpha
                               :lir
                               :org
                               :netrw
                               :Outline
                               :NeogitStatus
                               :NeogitCommitMessage
                               :NeogitNotification
                               :NeogitCommitView
                               :spectre_panel
                               ""]
            :events [:CursorMoved
                     :TermOpen
                     :DirChanged
                     :BufWinEnter
                     :BufFilePost
                     :InsertEnter
                     :BufWritePost]})

(util.setup :minibar opts)
