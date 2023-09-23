;; Show the filename in the top left corner.

(local opts {:ignore-filetypes [:help
                                :harpoon
                                :startify
                                :dashboard
                                :lir
                                :alpha
                                :packer
                                :neogitstatus
                                :Trouble
                                :lazy
                                :netrw
                                :Outline
                                :neo-tree
                                :neo-tree-popup
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

{1 :aktersnurra/minibar.nvim :event :BufReadPre : opts}
