;; Telescope a highly extendable fuzzy finder over lists.

(local keys [{1 :mf 2 :<cmd>FindFiles<cr> :desc "Find Files"}
             {1 :mg
              2 "<cmd>Telescope live_grep theme=dropdown<cr>"
              :desc "Find Text"}
             {1 :<leader>fc
              2 "<cmd>Telescope commands theme=dropdown<cr>"
              :desc :Commands}
             {1 :<leader>fH
              2 "<cmd>Telescope highlights<cr>"
              :desc :Highlights}
             {1 :<leader>fR
              2 "<cmd>Telescope registers theme=dropdown<cr>"
              :desc :Registers}
             {1 :<leader>fS
              2 "<cmd>Telescope grep_string theme=dropdown<cr>"
              :desc "Find String"}
             {1 :<leader>fb
              2 "<cmd>Telescope git_branches theme=dropdown<cr>"
              :desc "Checkout Branch"}
             {1 :<leader>ff 2 :<cmd>FindFiles<cr> :desc "Find files"}
             {1 :<leader>fh
              2 "<cmd>Telescope help_tags theme=dropdown<cr>"
              :desc :Help}
             {1 :<leader>fk
              2 "<cmd>Telescope keymaps theme=dropdown<cr>"
              :desc :Keymaps}
             {1 :<leader>fl
              2 "<cmd>Telescope resume theme=dropdown<cr>"
              :desc "Last Search"}
             {1 :<leader>fp
              2 "<cmd>Telescope projects theme=dropdown<cr>"
              :desc "Find Project"}
             {1 :<leader>fr
              2 "<cmd>Telescope oldfiles theme=dropdown<cr>"
              :desc "Recent File"}
             {1 :<leader>ft
              2 "<cmd>Telescope live_grep theme=dropdown<cr>"
              :desc "Find Text"}
             {1 :<leader>js
              2 "<cmd>Telescope diagnostics theme=dropdown<cr>"
              :desc "Telescope Diagnostics"}
             {1 :<leader>gb
              2 "<cmd>Telescope git_branches theme=dropdown<cr>"
              :desc "Checkout Branch"}
             {1 :<leader>gc
              2 "<cmd>Telescope git_commits theme=dropdown<cr>"
              :desc "Checkout Commit"}
             {1 :<leader>lS
              2 "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>"
              :desc "Workspace Symbols"}
             {1 :<leader>n
              2 "<cmd>Telescope lsp_document_symbols theme=dropdown<cr>"
              :desc "Document Symbols"}])

(fn setup []
  (let [telescope (require :telescope)
        actions (require :telescope.actions)]
    (telescope.setup {:defaults {:prompt_prefix "   "
                                 :selection_caret "> "
                                 :path_display [:smart]
                                 :color_devicons false
                                 :vimgrep_arguments [:rg
                                                     :--color=never
                                                     :--no-heading
                                                     :--with-filename
                                                     :--line-number
                                                     :--column
                                                     :--smart-case
                                                     :--hidden]
                                 :mappings {:i {:<C-n> actions.cycle_history_next
                                                :<C-p> actions.cycle_history_prev
                                                :<C-j> actions.move_selection_next
                                                :<C-k> actions.move_selection_previous
                                                :<C-c> actions.close
                                                :<Down> actions.move_selection_next
                                                :<Up> actions.move_selection_previous
                                                :<CR> actions.select_default
                                                :<C-x> actions.select_horizontal
                                                :<C-v> actions.select_vertical
                                                :<C-t> actions.select_tab
                                                :<C-u> actions.preview_scrolling_up
                                                :<C-d> actions.preview_scrolling_down
                                                :<PageUp> actions.results_scrolling_up
                                                :<PageDown> actions.results_scrolling_down
                                                :<Tab> (+ actions.toggle_selection
                                                          actions.move_selection_worse)
                                                :<S-Tab> (+ actions.toggle_selection
                                                            actions.move_selection_better)
                                                :<C-q> (+ actions.send_to_qflist
                                                          actions.open_qflist)
                                                :<M-q> (+ actions.send_selected_to_qflist
                                                          actions.open_qflist)
                                                :<C-l> actions.complete_tag
                                                :<C-_> actions.which_key}
                                            :n {:<esc> actions.close
                                                :<CR> actions.select_default
                                                :<C-x> actions.select_horizontal
                                                :<C-v> actions.select_vertical
                                                :<C-t> actions.select_tab
                                                :<Tab> (+ actions.toggle_selection
                                                          actions.move_selection_worse)
                                                :<S-Tab> (+ actions.toggle_selection
                                                            actions.move_selection_better)
                                                :<C-q> (+ actions.send_to_qflist
                                                          actions.open_qflist)
                                                :<M-q> (+ actions.send_selected_to_qflist
                                                          actions.open_qflist)
                                                :j actions.move_selection_next
                                                :k actions.move_selection_previous
                                                :H actions.move_to_top
                                                :M actions.move_to_middle
                                                :L actions.move_to_bottom
                                                :<Down> actions.move_selection_next
                                                :<Up> actions.move_selection_previous
                                                :gg actions.move_to_top
                                                :G actions.move_to_bottom
                                                :q actions.close
                                                :<C-u> actions.preview_scrolling_up
                                                :<C-d> actions.preview_scrolling_down
                                                :<PageUp> actions.results_scrolling_up
                                                :<PageDown> actions.results_scrolling_down
                                                :dd actions.delete_buffer
                                                :? actions.which_key}}}
                      :extensions {:fzf {:fuzzy true
                                         :override_generic_sorter true
                                         :override_file_sorter true
                                         :case_mode :smart_case}}})
    (telescope.load_extension :fzf)
    (telescope.load_extension :frecency)
    (telescope.load_extension :orgmode)
    (telescope.load_extension :projects)
    (telescope.load_extension :harpoon)))

{1 :nvim-telescope/telescope.nvim
 :cmd :Telescope
 :config (fn []
           (setup))
 :dependencies [:nvim-lua/popup.nvim
                :nvim-telescope/telescope-frecency.nvim
                {1 :nvim-telescope/telescope-fzf-native.nvim :build :make}
                :tami5/sqlite.lua
                {1 :ahmedkhalf/project.nvim
                 :event :VeryLazy
                 :opts {:active true
                        :on_config_done nil
                        :manual_mode false
                        :detection_methods [:patterns]
                        :patterns [:git
                                   :_darcs
                                   :.hg
                                   :.bzr
                                   :.svn
                                   :Makefile
                                   :package.json]
                        :show_hidden false
                        :silent_chdir true
                        :ignore_lsp {}
                        :datapath (vim.fn.stdpath :data)}
                 :config (lambda [_ opts]
                           (let [project (require :project_nvim)]
                             (project.setup opts)))}
                :nvim-lua/plenary.nvim
                :nvim-telescope/telescope-fzf-native.nvim
                :nvim-telescope/telescope-frecency.nvim
                :joaomsa/telescope-orgmode.nvim]
 : keys}
