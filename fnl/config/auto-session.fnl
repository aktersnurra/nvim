;; Session manager.
(module config.auto-session {autoload {util config.util}})

(def- auto-opts {:log_level :info
                 :auto_session_enable_last_session false
                 :auto_session_root_dir (.. (vim.fn.stdpath :data) :/sessions/)
                 :auto_session_enabled true
                 :auto_save_enabled nil
                 :auto_restore_enabled nil
                 :auto_session_suppress_dirs [(os.getenv :HOME)]
                 :auto_session_use_git_branch nil
                 :bypass_session_save_file_types [:alpha]})

(def- lens-opts {:path_display [:shorten]
                 :previewer false
                 :prompt_title :Sessions})

(set vim.o.sessionoptions
     "blank,buffers,curdir,folds,help,tabpages,winsize,winpos,terminal")
(util.setup :session-lens lens-opts)
(util.setup :auto-session auto-opts)
(let [telescope (require :telescope)]
  (telescope.load_extension :session-lens))
