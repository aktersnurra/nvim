;; Telescope a highly extendable fuzzy finder over lists.
(module config.telescope {autoload {util util nvim aniseed.nvim}})

(def- opts {:noremap true :silent true})

(let [telescope (util.load-plugin :telescope)]
  (let [actions (require :telescope.actions)]
    (telescope.setup {:defaults {:prompt_prefix " "
                                 :selection_caret " "
                                 :path_display [:smart]
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
                                                :<C-u> actions.preview_scrolling_up
                                                :<C-d> actions.preview_scrolling_down
                                                :<PageUp> actions.results_scrolling_up
                                                :<PageDown> actions.results_scrolling_down
                                                :? actions.which_key}}}
                      :extensions {:fzf {:fuzzy true
                                         :override_generic_sorter true
                                         :override_file_sorter true
                                         :case_mode :smart_case}}})
    (telescope.load_extension :fzf)
    (telescope.load_extension :file_browser)
    (telescope.load_extension :projects)
    (nvim.set_keymap :n :<C-b>
                     "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{sort_lastused = true, previewer = false})<cr>"
                     opts)
    (nvim.set_keymap :n :<C-f>
                     "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>"
                     opts)
    (nvim.set_keymap :n :<C-t> "<cmd>Telescope live_grep theme=ivy<cr>" opts)))
