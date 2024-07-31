;; Orgmode for nvim.

(local icons (require :settings.icons))

(local keys [{1 :<leader>oa
              2 :<cmd>OrgAgendaPrompt<cr>
              :desc "Open agenda prompt"}
             {1 :<leader>oc
              2 :<cmd>OrgCapturePrompt<cr>
              :desc "Open capture prompt"}
             {1 :<leader>of
              2 ":Telescope find_files theme=dropdown cwd=~/.local/share/org<CR>"
              :desc "Find org file"}
             {1 :<leader>oh
              2 "<cmd>Telescope orgmode search_headings theme=dropdown<cr>"
              :desc "Search headings"}])

(local user-cmds [[:OrgAgendaPrompt
                   (λ []
                     (let [orgmode (require :orgmode)]
                       (orgmode.action :agenda.prompt)))
                   {:nargs 0}]
                  [:OrgCapturePrompt
                   (λ []
                     (let [orgmode (require :orgmode)]
                       (orgmode.action :capture.prompt)))
                   {:nargs 0}]])

(local auto-cmds
       [[:FileType
         {:pattern :org
          :callback (λ []
                      (tset vim.opt_local :foldenable false)
                      (tset vim.opt_local :foldlevelstart 0)
                      (tset vim.opt_local :foldlevel 0)
                      (tset vim.opt_local :concealcursor :nc)
                      (tset vim.opt_local :conceallevel 2))}]])

(λ init []
  (let [{: create-auto-cmds : create-user-cmds} (require :util.cmds)]
    (create-user-cmds user-cmds)
    (create-auto-cmds auto-cmds)))

(local templates
       {:t {:description :Todo :template "* TODO %?\n %u\n DEADLINE: %T\n"}
        :m {:description :Meeting :template "* Meeting %?"}
        :n {:description :Note :template "* NOTE %? :NOTE:\n %u\n"}})

(local org-opts
       {:org_agenda_files "~/.local/share/org/**/*"
        :org_default_notes_file "~/.local/share/org/refile.org"
        :org_hide_emphasis_markers true
        :org_agenda_start_on_weekday false
        :org_startup_indented true
        :org_log_into_drawer :LOGBOOK
        :org_capture_templates templates
        :mappings {:org {:org_cycle :<c-e> :org_global_cycle :<s-e>}}})

(local bullets-opts
       {:concealcursor true
        :symbols {:list (. icons :line)
                  :headlines [(. icons :1)
                              (. icons :2)
                              (. icons :3)
                              (. icons :4)
                              (. icons :5)
                              (. icons :6)
                              (. icons :7)]
                  :checkboxes {:half [(. icons :line)
                                      "@org.checkbox.halfchecked"]
                               :done [(. icons :checkmark)
                                      "@org.checkbox.checked"]
                               :todo [" " "@org.checkbox.checked"]}}})

(local roam-templates
       {:n {:description :node
            :template "#+category: %^{type}
#+filetags: %^{tags}
#+date: %u

* %?"
            :target "%<%Y%m%d%H%M%S>-%[slug].org"}})

(local roam-opts {:directory "~/.local/share/org/roam"
                  :templates roam-templates})

(λ config []
  (let [orgmode (require :orgmode)
        roam (require :org-roam)
        bullets (require :org-bullets)]
    (orgmode.setup org-opts)
    (roam.setup roam-opts)
    (bullets.setup bullets-opts)))

{1 :nvim-orgmode/orgmode
 :dependencies [:akinsho/org-bullets.nvim :chipsenkbeil/org-roam.nvim]
 :ft [:org :orgagenda]
 : config
 : init
 : keys}
