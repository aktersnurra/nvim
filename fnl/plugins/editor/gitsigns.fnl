;; Add git signs to source files.

(local mappings [[:n
                  :mq
                  "<cmd>Gitsigns diffthis HEAD<cr>"
                  {:desc "Gitsigns diff"}]
                 [:n
                  :<leader>gR
                  "<cmd>lua require 'gitsigns'.reset_buffer()<cr>"
                  {:desc "Reset Buffer"}]
                 [:n
                  :<leader>gd
                  "<cmd>Gitsigns diffthis HEAD<cr>"
                  {:desc :Diff}]
                 [:n
                  :<leader>gj
                  "<cmd>lua require 'gitsigns'.next_hunk()<cr>"
                  {:desc "Next Hunk"}]
                 [:n
                  :<leader>gk
                  "<cmd>lua require 'gitsigns'.prev_hunk()<cr>"
                  {:desc "Prev Hunk"}]
                 [:n
                  :<leader>gl
                  "<cmd>lua require 'gitsigns'.blame_line()<cr>"
                  {:desc :Blame}]
                 [:n
                  :<leader>gp
                  "<cmd>lua require 'gitsigns'.preview_hunk()<cr>"
                  {:desc "Preview Hunk"}]
                 [:n
                  :<leader>gr
                  "<cmd>lua require 'gitsigns'.reset_hunk()<cr>"
                  {:desc "Reset Hunk"}]
                 [:n
                  :<leader>gs
                  "<cmd>lua require 'gitsigns'.stage_hunk()<cr>"
                  {:desc "Stage Hunk"}]
                 [:n
                  :<leader>gu
                  "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>"
                  {:desc "Undo Stage Hunk"}]
                 [[:o :x]
                  :<leader>gn
                  ":<C-U>Gitsigns select_hunk<CR>"
                  {:desc "GitSigns Select Hunk"}]])

(fn on-attach [bufnr]
  (each [_ mapping (ipairs mappings)]
    (match mapping
      [mode key cmd desc]
      (vim.keymap.set mode key cmd (vim.tbl_extend :force {:buffer bufnr} desc)))))

(local signs {:add {:hl :GitSignsAdd
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

(local opts {: signs
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
             :yadm {:enable false}
             :on_attach (fn [bufnr]
                          (on-attach bufnr))})

{1 :lewis6991/gitsigns.nvim :event [:BufReadPost :BufNewFile] : opts}
