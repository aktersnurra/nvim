;; Session manager.
(module config.auto-session {autoload {: util}})

(def- auto-opts {:log_level :info
                 :auto_session_enable_last_session true
                 :auto_session_root_dir (.. (vim.fn.stdpath :data) :/sessions/)
                 :auto_session_enabled true
                 :auto_save_enabled true
                 :auto_restore_enabled true
                 :auto_session_suppress_dirs [(os.getenv :HOME)]
                 :auto_session_use_git_branch nil
                 :bypass_session_save_file_types [:alpha]})

(def- lens-opts {:path_display [:shorten]
                 :previewer false
                 :prompt_title :Sessions})

(set vim.o.sessionoptions "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal")
(util.use-config :session-lens lens-opts)
(util.use-config :auto-session auto-opts)
