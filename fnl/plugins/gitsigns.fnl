;; Add git signs to source files.

(local keys [{1 :<leader>gR
              2 "<cmd>lua require 'gitsigns'.reset_buffer()<cr>"
              :mode :n
              :desc "Reset Buffer"}
             {1 :<leader>gd
              2 "<cmd>Gitsigns diffthis HEAD<cr>"
              :mode :n
              :desc :Diff}
             {1 :<leader>gj
              2 "<cmd>lua require 'gitsigns'.next_hunk()<cr>"
              :mode :n
              :desc "Next Hunk"}
             {1 :<leader>gk
              2 "<cmd>lua require 'gitsigns'.prev_hunk()<cr>"
              :mode :n
              :desc "Prev Hunk"}
             {1 :<leader>gl
              2 "<cmd>lua require 'gitsigns'.blame_line()<cr>"
              :mode :n
              :desc :Blame}
             {1 :<leader>gp
              2 "<cmd>lua require 'gitsigns'.preview_hunk()<cr>"
              :mode :n
              :desc "Preview Hunk"}
             {1 :<leader>gr
              2 "<cmd>lua require 'gitsigns'.reset_hunk()<cr>"
              :mode :n
              :desc "Reset Hunk"}
             {1 :<leader>gs
              2 "<cmd>lua require 'gitsigns'.stage_hunk()<cr>"
              :mode :n
              :desc "Stage Hunk"}
             {1 :<leader>gu
              2 "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>"
              :mode :n
              :desc "Undo Stage Hunk"}
             {1 :<leader>gn
              2 ":<C-U>Gitsigns select_hunk<CR>"
              :mode [:o :x]
              :desc "GitSigns Select Hunk"}])

(local icons (require :settings.icons))

(local signs {:add {:text (. icons :git-add)}
              :change {:text (. icons :git-add)}
              :delete {:text (. icons :git-delete)}
              :topdelete {:text (. icons :git-top-delete)}
              :changedelete {:text (. icons :git-change-delete)}
              :untracked {:text (. icons :git-untracked)}})

(local opts {: signs
             :signcolumn true
             :numhl false
             :linehl false
             :word_diff false
             :watch_gitdir {:follow_files true}
             :attach_to_untracked true
             :current_line_blame false
             :current_line_blame_opts {:virt_text true
                                       :virt_text_pos :eol
                                       :delay 1000
                                       :ignore_whitespace false}
             :current_line_blame_formatter "<author>, <author_time:%Y-%m-%d> - <summary>"
             :sign_priority 6
             :update_debounce 100
             :status_formatter nil
             :max_file_length 40000
             :preview_config {:border :single
                              :style :minimal
                              :relative :cursor
                              :row 0
                              :col 1}})

{1 :lewis6991/gitsigns.nvim :event [:BufReadPre :BufNewFile] : opts : keys}
