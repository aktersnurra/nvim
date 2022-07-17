;; Orgmode for nvim.
(module config.orgmode {autoload {nvim aniseed.nvim : util}})

(nvim.ex.set :conceallevel=2)
(nvim.ex.set :concealcursor=nc)

(def- templates
      {:t {:description :Task :template "* TODO %?\n %u\n DEADLINE: %T\n :TAGS:"}
       :m {:description :Meeting
           :template "* MEETING %? :MEETING: :LOGBOOK: CLOCK: %U :END:"}
       :n {:description :Note :template "* NOTE %? :NOTE:\n %u\n :TAGS:"}})

(let [orgmode (util.load-plugin :orgmode)]
  (orgmode.setup_ts_grammar)
  (orgmode.setup {:org_agenda_files ["~/.local/share/org/**/*"]
                  :org_default_notes_file "~/.local/share/org/refile.org"
                  :org_agenda_templates templates}))
