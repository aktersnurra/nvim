;; Orgmode for nvim.
(module config.orgmode {autoload {nvim aniseed.nvim : util}})

(nvim.ex.set :conceallevel=2)
(nvim.ex.set :concealcursor=nc)

(def- templates
      {:t {:description :Task
           :template "* TODO %?\n %u\n DEADLINE: %T\n"}
       :m {:description :Meeting
           :template "* Meeting %?"}
       :n {:description :Note :template "* NOTE %? :NOTE:\n %u\n"}})

(defn- create-title [task]
       (string.format "%s (%s)" task.category task.humanized_duration))

(defn- create-subtitle [task]
       (string.format "%s %s %s" (string.rep "*" task.level) task.todo
                      task.title))

(defn- get-date [task] (string.format "%s: %s" task.type (task.time:to_string)))

(def- notifications
      {:reminder_time [0 1 5 10]
       :repeater_reminder_time [0 1 5 10]
       :deadline_warning_reminder_time [0]
       :cron_notifier (fn [tasks]
                        (each [_ task (ipairs tasks)]
                          (let [title (create-title task)
                                sub-title (create-subtitle task)
                                date (get-date task)]
                            (if (vim.fn.executable :notify-send)
                                (vim.loop.spawn :notify-send
                                                {:args [:--icon=.local/share/nvim/site/pack/packer/start/orgmode/assets/orgmode_nvim.png
                                                        (string.format "%s\n%s\n%s"
                                                                       title
                                                                       subtitle
                                                                       date)]})))))})

(def- opts {:org_agenda_files ["~/.local/share/org/**/*"]
            :org_hide_emphasis_markers true
            :org_agenda_start_on_weekday false
            :org_default_notes_file "~/.local/share/org/refile.org"
            :org_agenda_templates templates
            : notifications})

(let [orgmode (util.load-plugin :orgmode)]
  (orgmode.setup_ts_grammar)
  (orgmode.setup opts))
