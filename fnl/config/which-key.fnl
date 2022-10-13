;; Which-key provides a pop-up meny for some key mappings.
(module config.which-key {autoload {: util nvim aniseed.nvim}})

(def- setup {:plugins {:marks true
                       :registers true
                       :spelling {:enabled true :suggestions 20}
                       :presets {:operators false
                                 :motions false
                                 :text_objects false
                                 :windows true
                                 :nav true
                                 :z true
                                 :g true}}
             :icons {:breadcrumb "»" :separator "" :group "+"}
             :popup_mappings {:scroll_down :<c-d> :scroll_up :<c-u>}
             :window {:border :rounded
                      :position :bottom
                      :margin [1 0 1 0]
                      :padding [2 2 2 2]
                      :winblend 0}
             :layout {:height {:min 4 :max 25}
                      :width {:min 20 :max 50}
                      :spacing 3
                      :align :left}
             :ignore_missing true
             :hidden [:<silent> :<cmd> :<Cmd> :<CR> :call :lua "^:" "^ "]
             :show_help true
             :triggers :auto
             :triggers_blacklist {:i [:j :k] :v [:j :k]}})

(def- mopts {:mode :n
             :prefix :m
             :buffer nil
             :silent true
             :noremap true
             :nowait true})

(def- diff {:name :Diff
            :m ["<cmd>Gitsigns diffthis HEAD<cr>" "Gitsigns diff"]
            :n [:<cmd>DiffviewFileHistory<cr> :DiffviewFileHistory]
            :e ["<cmd>DiffviewOpen -uno<cr>" :DiffviewOpen]
            :i [:<cmd>DiffviewClose<cr> :DiffviewClose]})

(def- mmappings {:a ["<cmd>lua require('harpoon.mark').add_file()<cr>"
                     :Harpoon]
                 :b ["<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{sort_lastused = true, initial_mode = 'normal', previewer = false})<cr>"
                     "Switch buffers"]
                 :d diff
                 :f ["<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
                     "Find files"]
                 :g ["<cmd>Telescope live_grep theme=ivy<cr>" "Find text"]
                 :l ["<cmd>lua require('harpoon.ui').nav_next()<cr>"
                     "Harpoon Next"]
                 :h ["<cmd>lua require('harpoon.ui').nav_prev()<cr>"
                     "Harpoon Prev"]
                 :t ["<cmd>Telescope harpoon marks theme=dropdown<cr>"
                     "Search Files"]
                 :v ["<cmd>lua vim.lsp.buf.rename()<cr>" :Rename]
                 :p [:<cmd>SaveSession<cr> "Save Session"]
                 :r ["<cmd>lua require('harpoon.ui').toggle_quick_menu()<cr>"
                     "Harpoon UI"]
                 :n [:<cmd>Neogit<cr> :Neogit]})

(def- nopts {:mode :n
             :prefix :<leader>
             :buffer nil
             :silent true
             :noremap true
             :nowait true})

(def- find {:name :Find
            :b ["<cmd>Telescope git_branches theme=dropdown<cr>"
                "Checkout branch"]
            :c ["<cmd>Telescope colorscheme theme=dropdown<cr>" :Colorscheme]
            :f ["<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
                "Find files"]
            :t ["<cmd>Telescope live_grep theme=ivy<cr>" "Find text"]
            :s ["<cmd>Telescope grep_string theme=dropdown<cr>" "Find String"]
            :h ["<cmd>Telescope help_tags<cr>" :Help]
            :H ["<cmd>Telescope highlights<cr>" :Highlights]
            :l ["<cmd>Telescope resume<cr>" "Last Search"]
            :M ["<cmd>Telescope man_pages<cr>" "Man Pages"]
            :r ["<cmd>Telescope oldfiles theme=dropdown<cr>" "Recent File"]
            :R ["<cmd>Telescope registers<cr>" :Registers]
            :k ["<cmd>Telescope keymaps<cr>" :Keymaps]
            :C ["<cmd>Telescope commands<cr>" :Commands]})

(def- diagnostics {:name :Diagnostics
                   :d [:<cmd>TroubleToggle<cr> :Trouble]
                   :D ["<cmd>Telescope diagnostics theme=dropdown<cr>"
                       "Telescope diagnostics"]})

(def- git {:name :Git
           :j ["<cmd>lua require 'gitsigns'.next_hunk()<cr>" "Next Hunk"]
           :k ["<cmd>lua require 'gitsigns'.prev_hunk()<cr>" "Prev Hunk"]
           :l ["<cmd>lua require 'gitsigns'.blame_line()<cr>" :Blame]
           :p ["<cmd>lua require 'gitsigns'.preview_hunk()<cr>" "Preview Hunk"]
           :r ["<cmd>lua require 'gitsigns'.reset_hunk()<cr>" "Reset Hunk"]
           :R ["<cmd>lua require 'gitsigns'.reset_buffer()<cr>" "Reset Buffer"]
           :s ["<cmd>lua require 'gitsigns'.stage_hunk()<cr>" "Stage Hunk"]
           :u ["<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>"
               "Undo Stage Hunk"]
           :o ["<cmd>Telescope git_status theme=dropdown<cr>"
               "Open changed file"]
           :b ["<cmd>Telescope git_branches theme=dropdown<cr>"
               "Checkout branch"]
           :c ["<cmd>Telescope git_commits theme=dropdown<cr>"
               "Checkout commit"]
           :d ["<cmd>Gitsigns diffthis HEAD<cr>" :Diff]})

(def- lsp {:name :LSP
           :a ["<cmd>lua vim.lsp.buf.code_action()<cr>" "Code Action"]
           :f ["<cmd>lua vim.lsp.buf.format { async = true }<cr>" :Format]
           :i [:<cmd>LspInfo<cr> :Info]
           :l ["<cmd>lua vim.lsp.codelens.run()<cr>" "CodeLens Action"]
           :r ["<cmd>lua vim.lsp.buf.rename()<cr>" :Rename]
           :s ["<cmd>Telescope lsp_document_symbols<cr>" "Document Symbols"]
           :S ["<cmd>Telescope lsp_dynamic_workspace_symbols<cr>"
               "Workspace Symbols"]})

(def- org {:name :Orgmode
           :a ["<cmd>lua require('orgmode').action('agenda.prompt')"
               "Open agenda prompt"]
           :c ["<cmd>lua require('orgmode').action('capture.prompt')"
               "Open capture prompt"]})

(def- packer {:name :Packer
              :c [:<cmd>PackerCompile<cr> :Compile]
              :i [:<cmd>PackerInstall<cr> :Install]
              :s [:<cmd>PackerSync<cr> :Sync]
              :S [:<cmd>PackerStatus<cr> :Status]
              :u [:<cmd>PackerUpdate<cr> :Update]})

(def- replace {:name :Replace
               :r ["<cmd>lua require('spectre').open()<cr>" :Replace]
               :w ["<cmd>lua require('spectre').open_visual({select_word=true})<cr>"
                   "Replace Word"]
               :f ["<cmd>lua require('spectre').open_file_search()<cr>"
                   "Replace Buffer"]})

(def- treesitter
      {:name :Treesitter :p [:<cmd>TSPlaygroundToggle<cr> :Playground]})

(defn- switch-window []
       (let [window-picker (require :window-picker)]
         (let [win (window-picker.pick_window)]
           (if (not= win nil)
               (nvim.set_current_win win)))))

(def- nmappings {:a ["<cmd>Telescope lsp_document_symbols theme=dropdown<cr>"
                     "Document Symbols"]
                 :c [:<cmd>Bdelete!<CR> "Close Buffer"]
                 :d diagnostics
                 :f find
                 :g git
                 :h [:<cmd>Alpha<cr> :Alpha]
                 :l lsp
                 :n ["<cmd>lua require('Comment.api').toggle.linewise.current()<CR>"
                     :Comment]
                 :o org
                 :p packer
                 :r replace
                 :s [switch-window "Switch window"]
                 :t [:<cmd>ToggleTerm<cr> :Terminal]
                 :T treesitter
                 :z [:<cmd>ZenMode<cr> "Zen Mode"]})

(def- vopts {:mode :v
             :prefix :<leader>
             :buffer nil
             :silent true
             :noremap true
             :nowait true})

(def- vmappings {:n ["<ESC><CMD>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<CR>"
                     :Comment]})

(let [which-key (util.load-plugin :which-key)]
  (which-key.setup setup)
  (which-key.register mmappings mopts)
  (which-key.register nmappings nopts)
  (which-key.register vmappings vopts))
