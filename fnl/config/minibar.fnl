(module config.minibar {autoload {util config.util}})

(def- opts {:ignore-filetypes [:help
                               :harpoon
                               :startify
                               :dashboard
                               :lir
                               :alpha
                               :packer
                               :neogitstatus
                               :Trouble
                               :org
                               :lazy
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
