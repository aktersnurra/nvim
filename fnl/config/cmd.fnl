;; Commands for plugins.
(module config.cmd {autoload {nvim aniseed.nvim util config.util}})

(nvim.create_user_command :OrgAgendaPrompt
                          (lambda []
                            (let [orgmode (util.prequire :orgmode)]
                              (orgmode.action :agenda.prompt)))
                          {:nargs 0})

(nvim.create_user_command :OrgCapturePrompt
                          (lambda []
                            (let [orgmode (util.prequire :orgmode)]
                              (orgmode.action :capture.prompt)))
                          {:nargs 0})

(nvim.create_user_command :CommentNormal
                          (lambda []
                            (let [comment-api (util.prequire :Comment.api)]
                              (comment-api.toggle.linewise.current)))
                          {:nargs 0})

(nvim.create_user_command :CommentVisual
                          (lambda []
                            (let [comment-api (util.prequire :Comment.api)]
                              (comment-api.toggle.linewise (vim.fn.visualmode))))
                          {:nargs 0})

(nvim.create_user_command :HarpoonAdd
                          (lambda []
                            (let [harpoon (util.prequire :harpoon.mark)]
                              (harpoon.add_file)))
                          {:nargs 0})

(nvim.create_user_command :HarpoonNext
                          (lambda []
                            (let [harpoon (util.prequire :harpoon.ui)]
                              (harpoon.nav_next)))
                          {:nargs 0})

(nvim.create_user_command :HarpoonPrev
                          (lambda []
                            (let [harpoon (util.prequire :harpoon.ui)]
                              (harpoon.nav_prev)))
                          {:nargs 0})

(nvim.create_user_command :HarpoonUI
                          (lambda []
                            (let [harpoon (util.prequire :harpoon.ui)]
                              (harpoon.toggle_quick_menu)))
                          {:nargs 0})

(nvim.create_user_command :Replace
                          (lambda []
                            (let [spectre (util.prequire :spectre)]
                              (spectre.open)))
                          {:nargs 0})

(nvim.create_user_command :ReplaceWord
                          (lambda []
                            (let [spectre (util.prequire :spectre)]
                              (spectre.open.open_visual {:select_word true})))
                          {:nargs 0})

(nvim.create_user_command :ReplaceInBuf
                          (lambda []
                            (let [spectre (util.prequire :spectre)]
                              (spectre.open_file_search)))
                          {:nargs 0})
