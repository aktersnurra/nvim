;; Statusbar.
(module config.lualine {autoload {: util}})

(def- disable [:neogitstatus
               :lir
               :alpha
               :Outline
               :NeogitStatus
               :NeogitCommitMessage])

(def- ignore [:help :packer :spectre_panel :TelescopePrompt])

(defn- active-clients [] (let [clients (vim.lsp.buf_get_clients)
                               client_names []]
                           (each [_ client (pairs clients)]
                             (if (not= client.name :null-ls)
                                 (table.insert client_names client.name)))
                           (if (> (length client_names) 0)
                               (table.concat client_names ", ")
                               "")))

(defn- hide-in-width [] (> (vim.fn.winwidth 0) 80))

(def- diagnostics {1 :diagnostics
                   :sources [:nvim_diagnostic]
                   :sections [:error :warn]
                   :symbols {:error " " :warn " "}
                   :colored false
                   :disabled_buftypes [:nvim-tree]
                   :padding 0
                   :update_in_insert false
                   :always_visible true})

(def- diff {1 :diff
            :colored false
            :disabled_buftypes [:nvim-tree]
            :cond hide-in-width})

(def- branch {1 "b:gitsigns_head"
              :icon " "
              :disabled_buftypes [:nvim-tree]
              :cond hide-in-width})

(def- filetype {1 :filetype
                :icon_only true
                :disabled_buftypes [:nvim-tree]
                :colored false
                :cond hide_in_width})

(def- language-server {1 active-clients
                       :disabled_buftypes [:nvim-tree]
                       :cond hide_in_width})

(def- opts {:options {:icons_enabled true
                      :theme :auto
                      :component_separators ""
                      :section_separators {:left "" :right ""}
                      :disabled_filetypes disable
                      :ignore_focus ignore
                      :always_divide_middle true
                      :globalstatus true}
            :sections {:lualine_a [:mode]
                       :lualine_b [branch diff]
                       :lualine_c {}
                       :lualine_x [language-server diagnostics]
                       :lualine_y [filetype]
                       :lualine_z [:location :progress]}
            :inactive_sections {:lualine_a [:mode]
                                :lualine_b {}
                                :lualine_c {}
                                :lualine_x {}
                                :lualine_y {}
                                :lualine_z [:location :progress]}
            :extensions []})

(util.use-config :lualine opts)
