;; Commands for plugins.

(fn telescope-builtin [builtin opts]
  (let [telescope (require :telescope.builtin)
        themes (require :telescope.themes)
        theme (. opts :theme)]
    ((. telescope builtin) ((. themes theme) opts))))

(local usercmds [[:OrgAgendaPrompt
                  (lambda []
                    (let [orgmode (require :orgmode)]
                      (orgmode.action :agenda.prompt)))
                  {:nargs 0}]
                 [:OrgCapturePrompt
                  (lambda []
                    (let [orgmode (require :orgmode)]
                      (orgmode.action :capture.prompt)))
                  {:nargs 0}]
                 [:CommentNormal
                  (lambda []
                    (let [comment-api (require :Comment.api)]
                      (comment-api.toggle.linewise.current)))
                  {:nargs 0}]
                 [:CommentVisual
                  (lambda []
                    (let [comment-api (require :Comment.api)]
                      (comment-api.toggle.linewise (vim.fn.visualmode))))
                  {:nargs 0}]
                 [:HarpoonAdd
                  (lambda []
                    (let [harpoon (require :harpoon.mark)]
                      (harpoon.add_file)))
                  {:nargs 0}]
                 [:HarpoonNext
                  (lambda []
                    (let [harpoon (require :harpoon.ui)]
                      (harpoon.nav_next)))
                  {:nargs 0}]
                 [:HarpoonPrev
                  (lambda []
                    (let [harpoon (require :harpoon.ui)]
                      (harpoon.nav_prev)))
                  {:nargs 0}]
                 [:HarpoonUI
                  (lambda []
                    (let [harpoon (require :harpoon.ui)]
                      (harpoon.toggle_quick_menu)))
                  {:nargs 0}]
                 [:Replace
                  (lambda []
                    (let [spectre (require :spectre)]
                      (spectre.open)))
                  {:nargs 0}]
                 [:ReplaceWord
                  (lambda []
                    (let [spectre (require :spectre)]
                      (spectre.open_visual {:select_word true})))
                  {:nargs 0}]
                 [:ReplaceInBuf
                  (lambda []
                    (let [spectre (require :spectre)]
                      (spectre.open_file_search)))
                  {:nargs 0}]
                 [:RestoreSession
                  (lambda []
                    (let [persistence (require :persistence)]
                      (persistence.load)))
                  {:nargs 0}]
                 [:RestoreLastSession
                  (lambda []
                    (let [persistence (require :persistence)]
                      (persistence.load {:last true})))
                  {:nargs 0}]
                 [:IgnoreSession
                  (lambda []
                    (let [persistence (require :persistence)]
                      (persistence.stop)))
                  {:nargs 0}]
                 [:FindFiles
                  (lambda []
                    (telescope-builtin :find_files
                                       {:theme :get_dropdown :previewer false}))
                  {:nargs 0}]])

(each [_ usercmd (ipairs usercmds)]
  (match usercmd
    [event cmd opts] (vim.api.nvim_create_user_command event cmd opts)))
