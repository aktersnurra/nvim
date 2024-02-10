;; UI for messages, cmdline and the popup menu.

(local icons (require :settings.icons))

(local opts
       {:cmdline {:enabled true
                  :view :cmdline_popup
                  :format {:cmdline {:pattern "^:"
                                     :icon (. icons :caret)
                                     :lang :vim}
                           :search_down {:view :cmdline
                                         :icon (.. (. icons :search-text) " "
                                                   (. icons :down))}
                           :search_up {:view :cmdline
                                       :icon (.. (. icons :search-text) " "
                                                 (. icons :up))}}}
        :messages {:enabled true}
        :popupmenu {:enabled true :backend :nui}
        :notify {:enabled false}
        :lsp {:override {:vim.lsp.util.convert_input_to_markdown_lines true
                         :vim.lsp.util.stylize_markdown true
                         :cmp.entry.get_documentation true}}
        :presets {:bottom_search true
                  ;; use a classic bottom cmdline for search
                  :command_palette false
                  ;; position the cmdline and popupmenu together
                  :long_message_to_split false
                  ;; long messages will be sent to a split
                  :inc_rename true
                  ;; enables an input dialog for inc-rename.nvim
                  :lsp_doc_border true}
        :views {:cmdline_popup {:border {:style :single}
                                :position {:row "42%" :col "50%"}
                                :size {:width 60 :height :auto}
                                :filter_options {}
                                :scrollbar false
                                :win_options {:winhighlight {:Normal :NormalFloat
                                                             :FloatBorder :FloatBorder}}}
                :popupmenu {:relative :editor
                            :position {:row "51%" :col "50%"}
                            :size {:width 60 :height 10}
                            :border {:style :single :padding [0 0]}
                            :scrollbar false
                            :win_options {:winhighlight {:Normal :Normal
                                                         :FloatBorder :FloatBorder}}}}})

{1 :folke/noice.nvim
 :event :VeryLazy
 :dependencies [:MunifTanjim/nui.nvim]
 : opts}
