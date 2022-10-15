;; Add git signs to source files.
(module config.gitsigns {autoload {:util :config.util}})

(def- signs {:add {:hl :GitSignsAdd
                   :text "|"
                   :numhl :GitSignsAddNr
                   :linehl :GitSignsAddLn}
             :change {:hl :GitSignsChange
                      :text "|"
                      :numhl :GitSignsChangeNr
                      :linehl :GitSignsChangeLn}
             :delete {:hl :GitSignsDelete
                      :text "_"
                      :numhl :GitSignsDeleteNr
                      :linehl :GitSignsDeleteLn}
             :topdelete {:hl :GitSignsDelete
                         :text "‾"
                         :numhl :GitSignsDeleteNr
                         :linehl :GitSignsDeleteLn}
             :changedelete {:hl :GitSignsChange
                            :text "~"
                            :numhl :GitSignsChangeNr
                            :linehl :GitSignsChangeLn}})

(def- opts {: signs
            :signcolumn true
            :numhl false
            :linehl false
            :word_diff false
            :watch_gitdir {:interval 1000 :follow_files true}
            :attach_to_untracked true
            :current_line_blame false
            :current_line_blame_opts {:virt_text true
                                      :virt_text_pos :eol
                                      :delay 1000
                                      :ignore_whitespace false}
            :current_line_blame_formatter_opts {:relative_time false}
            :sign_priority 6
            :update_debounce 100
            :status_formatter nil
            :max_file_length 40000
            :preview_config {:border :single
                             :style :minimal
                             :relative :cursor
                             :row 0
                             :col 1}
            :yadm {:enable false}})

(util.setup :gitsigns opts)
