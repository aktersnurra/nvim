;; File manager.

(local cursorline (require :util.cursorline))

(fn init []
  (set vim.g.neo_tree_remove_legacy_commands 1)
  (if (= (vim.fn.argc) 1)
      (let [stat (vim.loop.fs_stat (vim.fn.argv 1))]
        (if (and stat (= stat.type :directory))
            (require :neo-tree)))))

(fn deactivate []
  (vim.cmd "Neotree close"))

(local opts {:sources [:filesystem :buffers :git_status :document_symbols]
             :source_selector {:winbar false :statusline false}
             :use_popups_for_input false
             :enable_git_status false
             :enable_diagnostics false
             :open_files_do_not_replace_types [:terminal :Trouble :qf :Outline]
             :filesystem {:bind_to_cwd false
                          :follow_current_file true
                          :hijack_netrw_behavior :open_default
                          :use_libuv_file_watcher true}
             :window {:position :float
                      :popup {:position {:col "50%" :row :10}}
                      :mappings {:<space> :none
                                 :P {1 :toggle_preview
                                     :config {:use_float true}}
                                 :l :open
                                 :h :close_node
                                 :. :toggle_hidden
                                 :e :focus_preview}}
             :default_component_configs {:indent {:with_expanders true
                                                  :expander_collapsed ""
                                                  :expander_expanded ""
                                                  :expander_highlight :NeoTreeExpander}}
             :event_handlers [{:event :neo_tree_buffer_enter
                               :handler cursorline.show}
                              {:event :neo_tree_buffer_leave
                               :handler cursorline.show}]})

{1 :nvim-neo-tree/neo-tree.nvim
 :keys [{1 "-" 2 "<cmd>Neotree filesystem reveal<cr>" :desc "Open Neotree"}]
 ; :event :VeryLazy
 :cmd :Neotree
 : init
 : deactivate
 : opts
 :dependencies [:nvim-lua/plenary.nvim
                :nvim-tree/nvim-web-devicons
                :MunifTanjim/nui.nvim]}
