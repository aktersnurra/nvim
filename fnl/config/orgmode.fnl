;; Orgmode for nvim.
(module config.orgmode {autoload {nvim aniseed.nvim util config.util}})

(nvim.ex.set :conceallevel=2)
(nvim.ex.set :concealcursor=nc)

(def- templates
      {:t {:description :Task :template "* TODO %?\n %u\n DEADLINE: %T\n"}
       :m {:description :Meeting :template "* Meeting %?"}
       :n {:description :Note :template "* NOTE %? :NOTE:\n %u\n"}})

(defn- create-title [task]
       (string.format "%s (%s)" task.category task.humanized_duration))

(defn- create-subtitle [task]
       (string.format "%s %s %s" (string.rep "*" task.level) task.todo
                      task.title))

(defn- get-date [task] (string.format "%s: %s" task.type (task.time:to_string)))

(def- opts {:org_agenda_files ["~/.local/share/org/**/*"]
            :org_hide_emphasis_markers true
            :org_agenda_start_on_weekday false
            :org_default_notes_file "~/.local/share/org/refile.org"
            :org_agenda_templates templates})

(let [orgmode (util.prequire :orgmode)]
  (orgmode.setup_ts_grammar)
  (orgmode.setup opts))
