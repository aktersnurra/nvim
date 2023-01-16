;; Orgmode for nvim.

(local templates
       {:t {:description :Task :template "* TODO %?\n %u\n DEADLINE: %T\n"}
        :m {:description :Meeting :template "* Meeting %?"}
        :n {:description :Note :template "* NOTE %? :NOTE:\n %u\n"}})

(local opts {:org_agenda_files ["~/.local/share/org/**/*"]
             :org_hide_emphasis_markers true
             :org_agenda_start_on_weekday false
             :org_default_notes_file "~/.local/share/org/refile.org"
             :org_agenda_templates templates})

(fn setup []
  (let [orgmode (require :orgmode)]
    (tset vim.opt :conceallevel 2)
    (tset vim.opt :concealcursor :nc)
    (orgmode.setup_ts_grammar)
    (orgmode.setup opts)))

{1 :nvim-orgmode/orgmode
 :config (fn []
           (setup))
 :event :BufReadPost
 :keys [{1 :ga 2 :<cmd>OrgAgendaPrompt<cr> :desc "Open agenda prompt"}
        {1 :gc 2 :<cmd>OrgCapturePrompt<cr> :desc "Open capture prompt"}
        {1 :gm
         2 "<cmd>Telescope orgmode search_headings theme=dropdown<cr>"
         :desc "Search headings"}]}
