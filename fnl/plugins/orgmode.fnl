;; Orgmode for nvim.

(local icons (require :settings.icons))

(local keys [{1 :ga 2 :<cmd>OrgAgendaPrompt<cr> :desc "Open agenda prompt"}
             {1 :gc 2 :<cmd>OrgCapturePrompt<cr> :desc "Open capture prompt"}
             {1 :go
              2 ":Telescope find_files theme=dropdown cwd=~/.local/share/org<CR>"
              :desc "Find org file"}
             {1 :gm
              2 "<cmd>Telescope orgmode search_headings theme=dropdown<cr>"
              :desc "Search headings"}])

(local user-cmds [[:OrgAgendaPrompt
                   (lambda []
                     (let [orgmode (require :orgmode)]
                       (orgmode.action :agenda.prompt)))
                   {:nargs 0}]
                  [:OrgCapturePrompt
                   (lambda []
                     (let [orgmode (require :orgmode)]
                       (orgmode.action :capture.prompt)))
                   {:nargs 0}]])

(local auto-cmds
       [[:FileType
         {:pattern :org
          :callback (fn []
                      (tset vim.opt_local :foldenable false)
                      (tset vim.opt_local :foldlevelstart 0)
                      (tset vim.opt_local :foldlevel 0)
                      (tset vim.opt_local :conceallevel 2))}]])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-user-cmds user-cmds)
    (cmds.create-auto-cmds auto-cmds)))

(local templates
       {:t {:description :Task :template "* TODO %?\n %u\n DEADLINE: %T\n"}
        :m {:description :Meeting :template "* Meeting %?"}
        :n {:description :Note :template "* NOTE %? :NOTE:\n %u\n"}})

(lambda handler [data]
  (let [options {}
        options-by-label {}]
    (each [_ item (ipairs data.items)]
      (when (and item.key (not= (item.label:lower) :quit))
        (table.insert options item.label)
        (tset options-by-label item.label item)))
    (vim.ui.select options {:prompt data.prompt}
                   (fn [choice]
                     ;; FIX: this code block
                     (when (not choice)
                       (lua "return "))
                     (local option (. options-by-label choice))
                     (when option.action
                       (option.action))))))

(local opts
       {:org_agenda_files ["~/.local/share/org/**/*"]
        :org_hide_emphasis_markers true
        :org_agenda_start_on_weekday false
        :org_startup_indented true
        :org_log_into_drawer :LOGBOOK
        :org_default_notes_file "~/.local/share/org/refile.org"
        :org_agenda_templates templates
        :ui {:menu {: handler}}
        :mappings {:org {:org_cycle :<c-e> :org_global_cycle :<s-e>}}})

(fn config []
  (let [orgmode (require :orgmode)
        bullets (require :org-bullets)]
    (orgmode.setup_ts_grammar)
    (orgmode.setup opts)
    (bullets.setup {:concealcursor true
                    :symbols {:list (. icons :line)
                              :headlines [(. icons :orb)
                                          (. icons :filled-orb)
                                          (. icons :pentagon)
                                          (. icons :filled-pentagon)]
                              :checkboxes {:half [(. icons :line)
                                                  "@org.checkbox.halfchecked"]
                                           :done [(. icons :checkmark)
                                                  "@org.checkbox.checked"]
                                           :todo [" " "@org.checkbox.checked"]}}})))

{1 :nvim-orgmode/orgmode
 :dependencies :akinsho/org-bullets.nvim
 :ft [:org :orgagenda]
 : config
 : init
 : keys}
