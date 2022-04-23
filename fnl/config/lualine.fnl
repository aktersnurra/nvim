;; Statusbar.
(module config.lualine {autoload {util util}})

(defn- hide-in-width [] (> (vim.fn.winwidth 0) 80))

(def- diagnostics
  {1 :diagnostics
   :sources [:nvim_diagnostic]
   :sections [:error :warn]
   :symbols {:error " " :warn " "}
   :colored false
   :update_in_insert false
   :always_visible true})

(def- diff
  {1 :diff
   :colored false
   :symbols {:added " " :modified " " :removed " "}
   :cond hide-in-width})

(def- branch {1 "b:gitsigns_head" :icon " " :cond hide-in-width})

(def- filetype {1 :filetype :cond hide_in_width :color {}})

(let [lualine (util.load-plugin :lualine)]
  (lualine.setup
    {:options
     {:icons_enabled true
      :theme :auto
      :component_separators {:left "" :right ""}
      :section_separators {:left "" :right ""}
      :disabled_filetypes [:alpha
                           :dashboard
                           :NvimTree
                           :Outline]
      :always_divide_middle true}
      :sections {:lualine_a [:mode]
                 :lualine_b [branch :filename]
                 :lualine_c [diff]
                 :lualine_x [diagnostics filetype]
                 :lualine_y {}
                 :lualine_z [:location :progress :encoding]}
      :inactive_sections {:lualine_a [:mode]
                          :lualine_b [:filename]
                          :lualine_c {}
                          :lualine_x {}
                          :lualine_y {}
                          :lualine_z [:location
                                      :progress
                                      :encoding]}
      :tabline {}
      :extensions {}}))
