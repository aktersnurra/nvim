;; Telescope a highly extendable fuzzy finder over lists.

(local dependencies
       [:nvim-lua/popup.nvim
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
         :config (λ [_ opts]
                   (let [project (require :project_nvim)]
                     (project.setup opts)))}
        :nvim-lua/plenary.nvim
        :nvim-telescope/telescope-fzf-native.nvim
        :nvim-telescope/telescope-frecency.nvim
        {1 :nvim-orgmode/telescope-orgmode.nvim}])

(local extensions [:fzf
                   :frecency
                   :orgmode
                   :projects
                   :git_worktree
                   :harpoon
                   :rest])

(λ load-extensions [telescope]
  (each [_ extension (ipairs extensions)]
    (telescope.load_extension extension)))

(λ telescope-builtin [builtin opts]
  (let [telescope (require :telescope.builtin)
        themes (require :telescope.themes)
        theme (. opts :theme)]
    ((. telescope builtin) ((. themes theme) opts))))

(local user-cmds [[:FindFiles
                   (λ []
                     (telescope-builtin :find_files
                                        {:theme :get_ivy :previewer false}))
                   {:nargs 0}]])

(λ init []
  (let [{: create-user-cmds} (require :util.cmds)]
    (create-user-cmds user-cmds)))

(local keys [{1 :mf 2 :<cmd>FindFiles<cr> :desc "Find Files"}
             {1 :mg
              2 "<cmd>Telescope live_grep theme=ivy<cr>"
              :desc "Find Text"}
             {1 :<tab>
              2 "<cmd>Telescope buffers theme=ivy previewer=true initial_mode=normal<cr>"
              :desc "Switch Buffer"}
             {1 :<leader>fC
              2 "<cmd>Telescope commands theme=ivy<cr>"
              :desc :Commands}
             {1 :<leader>fH
              2 "<cmd>Telescope highlights<cr>"
              :desc :Highlights}
             {1 :<leader>fR
              2 "<cmd>Telescope registers theme=ivy<cr>"
              :desc :Registers}
             {1 :<leader>fS
              2 "<cmd>Telescope grep_string theme=ivy<cr>"
              :desc "Find String"}
             {1 :<leader>gb
              2 "<cmd>Telescope git_branches theme=ivy<cr>"
              :desc "Checkout Branch"}
             {1 :<leader>ff 2 :<cmd>FindFiles<cr> :desc "Find files"}
             {1 :<leader>fh
              2 "<cmd>Telescope help_tags theme=ivy<cr>"
              :desc :Help}
             {1 :<leader>fk
              2 "<cmd>Telescope keymaps theme=ivy<cr>"
              :desc :Keymaps}
             {1 :<leader>fl
              2 "<cmd>Telescope resume theme=ivy<cr>"
              :desc "Last Search"}
             {1 :<leader>fp
              2 "<cmd>Telescope projects theme=ivy<cr>"
              :desc "Find Project"}
             {1 :<leader>fr
              2 "<cmd>Telescope oldfiles theme=ivy<cr>"
              :desc "Recent File"}
             {1 :<leader>ft
              2 "<cmd>Telescope live_grep theme=ivy<cr>"
              :desc "Find Text"}
             {1 :<leader>gc
              2 "<cmd>Telescope git_commits theme=ivy<cr>"
              :desc "Checkout Commit"}])

(λ config []
  (let [telescope (require :telescope)
        actions (require :telescope.actions)
        icons (require :settings.icons)]
    (telescope.setup {:defaults {:prompt_prefix (.. "  " (. icons :telescope)
                                                    "  ")
                                 :selection_caret (.. (. icons :caret) " ")
                                 :path_display [:smart]
                                 :color_devicons false
                                 :pickers {:find_files {:theme :dropdown}}
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
    (load-extensions telescope)))

{1 :nvim-telescope/telescope.nvim
 :cmd :Telescope
 : init
 : config
 : dependencies
 : keys}
