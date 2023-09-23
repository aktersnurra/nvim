;; Find and replace.

(local user-cmds [[:Replace
                   (lambda []
                     (let [spectre (require :spectre)]
                       (spectre.open)))
                   {:nargs 0}]
                  [:ReplaceWord
                   (lambda []
                     (let [spectre (require :spectre)]
                       (spectre.open_visual {:select_word true})))
                   {:nargs 0}]
                  [:ReplaceInBuf
                   (lambda []
                     (let [spectre (require :spectre)]
                       (spectre.open_file_search)))
                   {:nargs 0}]])

(local auto-cmds
       [[:FileType
         {:pattern [:spectre_panel]
          :command "nnoremap <silent> <buffer> q :close<CR>"}]
        [:FileType {:pattern [:spectre_panel] :command "setlocal spell!"}]])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-user-cmds user-cmds)
    (cmds.create-auto-cmds auto-cmds)))

(local opts {:color_devicons true
             :highlight {:ui :String :search :DiffChange :replace :DiffDelete}
             :mapping {:toggle_line {:map :t
                                     :cmd "<cmd>lua require('spectre').toggle_line()<CR>"
                                     :desc "toggle current item"}
                       :enter_file {:map :<cr>
                                    :cmd "<cmd>lua require('spectre.actions').select_entry()<CR>"
                                    :desc "goto current file"}
                       :send_to_qf {:map :Q
                                    :cmd "<cmd>lua require('spectre.actions').send_to_qf()<CR>"
                                    :desc "send all item to quickfix"}
                       :replace_cmd {:map :c
                                     :cmd "<cmd>lua require('spectre.actions').replace_cmd()<CR>"
                                     :desc "input replace vim command"}
                       :show_option_menu {:map :o
                                          :cmd "<cmd>lua require('spectre').show_options()<CR>"
                                          :desc "show option"}
                       :run_replace {:map :R
                                     :cmd "<cmd>lua require('spectre.actions').run_replace()<CR>"
                                     :desc "replace all"}
                       :change_view_mode {:map :m
                                          :cmd "<cmd>lua require('spectre').change_view()<CR>"
                                          :desc "change result view mode"}
                       :toggle_ignore_case {:map :I
                                            :cmd "<cmd>lua require('spectre').change_options('ignore-case')<CR>"
                                            :desc "toggle ignore case"}
                       :toggle_ignore_hidden {:map :H
                                              :cmd "<cmd>lua require('spectre').change_options('hidden')<CR>"
                                              :desc "toggle search hidden"}}
             :find_engine {:rg {:cmd :rg
                                :args [:--color=never
                                       :--no-heading
                                       :--with-filename
                                       :--line-number
                                       :--column]
                                :options {:ignore-case {:value :--ignore-case
                                                        :icon "[I]"
                                                        :desc "ignore case"}
                                          :hidden {:value :--hidden
                                                   :desc "hidden file"
                                                   :icon "[H]"}}}}
             :replace_engine {:sed {:cmd :sed :args nil}
                              :options {:ignore-case {:value :--ignore-case
                                                      :icon "[I]"
                                                      :desc "ignore case"}}}
             :default {:find {:cmd :rg :options [:ignore-case]}
                       :replace {:cmd :sed}}
             :replace_vim_cmd :cdo
             :is_open_target_win true
             :is_insert_mode false})

{1 :windwp/nvim-spectre
 :event :BufReadPost
 : init
 :keys [{1 :<leader>rn 2 :<cmd>ReplaceInBuf<cr> :desc "Replace in Buffer"}
        {1 :<leader>re 2 :<cmd>Replace<cr> :desc :Replace}
        {1 :<leader>ri 2 :<cmd>ReplaceWord<cr> :desc "Replace Word"}]
 : opts}
