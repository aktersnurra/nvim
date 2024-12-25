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

(local keys [{1 :mf
              2 "<cmd>Telescope find_files theme=ivy previewer=false disable_devicons=true<cr>"
              :desc "Find Files"}
             {1 :mg
              2 "<cmd>Telescope live_grep theme=dropdown<cr>"
              :desc "Find Text"}
             {1 :mb
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
             {1 :<leader>ff
              2 "<cmd>Telescope find_files theme=ivy<cr>"
              :desc "Find files"}
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
              2 "<cmd>Telescope oldfiles theme=ivy previewer=false<cr>"
              :desc "Recent File"}
             {1 :<leader>ft
              2 "<cmd>Telescope live_grep theme=ivy<cr>"
              :desc "Find Text"}
             {1 :<leader>gc
              2 "<cmd>Telescope git_commits theme=ivy<cr>"
              :desc "Checkout Commit"}])

(λ config []
  (let [telescope (require :telescope)
        icons (require :settings.icons)]
    (telescope.setup {:defaults {:prompt_prefix (.. "  " (. icons :telescope)
                                                    "  ")
                                 :selection_caret (.. (. icons :caret) " ")
                                 :path_display [:smart]
                                 :color_devicons false
                                 :pickers {:find_files {:theme :dropdown
                                                        :disable_devicons true}}
                                 :vimgrep_arguments [:rg
                                                     :--color=never
                                                     :--no-heading
                                                     :--with-filename
                                                     :--line-number
                                                     :--column
                                                     :--smart-case
                                                     :--hidden]}
                      :extensions {:fzf {:fuzzy true
                                         :override_generic_sorter true
                                         :override_file_sorter true
                                         :case_mode :smart_case}}})
    (load-extensions telescope)))

{1 :nvim-telescope/telescope.nvim
 :cmd :Telescope
 : config
 : dependencies
 : keys}
