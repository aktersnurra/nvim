;; Topbar that displays open buffers.
(module config.bufferline {autoload {util util}})

(def- options {:numbers :none
               :close_command "Bdelete! %d"
               :right_mouse_command nil
               :left_mouse_command nil
               :middle_mouse_command nil
               :indicator_icon ""
               :buffer_close_icon ""
               :modified_icon "●"
               :close_icon ""
               :left_trunc_marker "<"
               :right_trunc_marker ">"
               :max_name_length 30
               :max_prefix_length 30
               :tab_size 21
               :diagnostics false
               :diagnostics_update_in_insert false
               :offsets [{:filetype :NvimTree :text "" :padding 1}]
               :show_buffer_icons false
               :show_buffer_close_icons false
               :show_close_icon false
               :show_tab_indicators false
               :persist_buffer_sort true
               :separator_style :thin
               :enforce_regular_tabs true
               :always_show_bufferline true})

(def- default-bg-tabline {:attribute :bg :highlight :TabLine})

(def- default-bg-normal {:attribute :bg :highlight :Normal})

(def- default-fg-tabline {:attribute :fg :highlight :TabLine})

(def- default-fg-normal {:attribute :fg :highlight :Normal})

(def- highlights
      {:fill {:guifg {:attribute :fg :highlight "#ff0000"}
              :guibg default-bg-tabline}
       :background {:guifg default-fg-tabline :guibg default-bg-tabline}
       :buffer_visible {:guifg default-fg-tabline :guibg default-bg-tabline}
       :close_button {:guifg default-fg-tabline :guibg default-bg-tabline}
       :close_button_visible {:guifg default-fg-tabline
                              :guibg default-bg-tabline}
       :tab_selected {:guifg default-fg-normal :guibg default-bg-normal}
       :tab {:guifg default-fg-tabline :guibg default-bg-tabline}
       :tab_close {:guifg {:attribute :fg :highlight :TabLineSel}
                   :guibg default-bg-normal}
       :duplicate_selected {:guifg {:attribute :fg :highlight :TabLineSel}
                            :guibg {:attribute :bg :highlight :TabLineSel}
                            :gui :italic}
       :duplicate_visible {:guifg default-fg-tabline
                           :guibg default-bg-tabline
                           :gui :italic}
       :duplicate {:guifg default-fg-tabline
                   :guibg default-bg-tabline
                   :gui :italic}
       :modified {:guifg default-fg-tabline :guibg default-bg-tabline}
       :modified_selected {:guifg default-fg-normal :guibg default-bg-normal}
       :modified_visible {:guifg default-fg-tabline :guibg default-bg-tabline}
       :separator {:guifg default-bg-tabline :guibg default-bg-tabline}
       :separator_selected {:guifg default-bg-normal :guibg default-bg-normal}
       :indicator_selected {:guifg {:attribute :fg
                                    :highlight :LspDiagnosticsDefaultHint}
                            :guibg default-bg-normal}})

(let [bufferline (util.load-plugin :bufferline)]
  (bufferline.setup {: options : highlights}))
