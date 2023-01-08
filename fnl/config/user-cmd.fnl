;; Commands for plugins.
(module config.user-cmd {autoload {nvim aniseed.nvim util config.util}})

(nvim.create_user_command :OrgAgendaPrompt
                          (lambda []
                            (let [orgmode (require :orgmode)]
                              (orgmode.action :agenda.prompt)))
                          {:nargs 0})

(nvim.create_user_command :OrgCapturePrompt
                          (lambda []
                            (let [orgmode (require :orgmode)]
                              (orgmode.action :capture.prompt)))
                          {:nargs 0})

(nvim.create_user_command :CommentNormal
                          (lambda []
                            (let [comment-api (require :Comment.api)]
                              (comment-api.toggle.linewise.current)))
                          {:nargs 0})

(nvim.create_user_command :CommentVisual
                          (lambda []
                            (let [comment-api (require :Comment.api)]
                              (comment-api.toggle.linewise (vim.fn.visualmode))))
                          {:nargs 0})

(nvim.create_user_command :HarpoonAdd
                          (lambda []
                            (let [harpoon (require :harpoon.mark)]
                              (harpoon.add_file)))
                          {:nargs 0})

(nvim.create_user_command :HarpoonNext
                          (lambda []
                            (let [harpoon (require :harpoon.ui)]
                              (harpoon.nav_next)))
                          {:nargs 0})

(nvim.create_user_command :HarpoonPrev
                          (lambda []
                            (let [harpoon (require :harpoon.ui)]
                              (harpoon.nav_prev)))
                          {:nargs 0})

(nvim.create_user_command :HarpoonUI
                          (lambda []
                            (let [harpoon (require :harpoon.ui)]
                              (harpoon.toggle_quick_menu)))
                          {:nargs 0})

(nvim.create_user_command :Replace
                          (lambda []
                            (let [spectre (require :spectre)]
                              (spectre.open)))
                          {:nargs 0})

(nvim.create_user_command :ReplaceWord
                          (lambda []
                            (let [spectre (require :spectre)]
                              (spectre.open_visual {:select_word true})))
                          {:nargs 0})

(nvim.create_user_command :ReplaceInBuf
                          (lambda []
                            (let [spectre (require :spectre)]
                              (spectre.open_file_search)))
                          {:nargs 0})

(nvim.create_user_command :RestoreSession
                          (lambda []
                            (let [persistence (require :persistence)]
                              (persistence.load)))
                          {:nargs 0})

(nvim.create_user_command :RestoreLastSession
                          (lambda []
                            (let [persistence (require :persistence)]
                              (persistence.load {:last true})))
                          {:nargs 0})

(nvim.create_user_command :IgnoreSession
                          (lambda []
                            (let [persistence (require :persistence)]
                              (persistence.stop)))
                          {:nargs 0})

(nvim.create_user_command :FindFiles
                          (lambda []
                            (util.telescope-builtin :find_files
                                                    {:theme :get_dropdown
                                                     :previewer false}))
                          {:nargs 0})
