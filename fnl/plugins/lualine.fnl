;; Statusbar.

(local icons (require :settings.icons))

(local disable [:neogitstatus
                :netrw
                :lir
                :lazy
                :alpha
                :neo-tree
                :Outline
                :NeogitStatus
                :NeogitCommitMessage])

(local ignore [:help :packer :spectre_panel :TelescopePrompt])

(λ active-clients []
  (let [clients (vim.lsp.get_clients)
        buf_num (vim.api.nvim_buf_get_number 0)
        client_names []]
    (each [_ client (pairs clients)]
      (when (. (. client :attached_buffers) buf_num)
        (table.insert client_names client.name)))
    (if (> (length client_names) 0)
        (table.concat client_names ", ")
        "")))

(λ hide-in-width []
  (> (vim.fn.winwidth 0) 80))

(local diagnostics {1 :diagnostics
                    :sources [:nvim_diagnostic]
                    :sections [:error :warn]
                    :symbols {:error (.. (. icons :error) " ")
                              :warn (.. (. icons :warn) " ")}
                    :colored false
                    :padding 0
                    :update_in_insert false
                    :always_visible true})

(local diff {1 :diff :colored false :cond hide-in-width})

(local branch {1 "b:gitsigns_head" :icon (. icons :git) :cond hide-in-width})

(local filetype {1 :filetype
                 :icon_only true
                 :colored false
                 :cond hide-in-width})

(local language-server {1 active-clients :cond hide-in-width})

(local lsp-progress
       {1 :lsp_progress
        :display_components [[:title :percentage :message]]
        :timer {:progress_enddelay 500 :lsp_client_name_enddelay 500}})

(local opts {:options {:icons_enabled true
                       :theme :auto
                       :component_separators ""
                       :section_separators {:left "" :right ""}
                       :disabled_filetypes disable
                       :ignore_focus ignore
                       :always_divide_middle true
                       :globalstatus true}
             :sections {:lualine_a [:mode]
                        :lualine_b [:filename branch diff]
                        :lualine_c {}
                        :lualine_x [lsp-progress language-server diagnostics]
                        :lualine_y [filetype]
                        :lualine_z [:location :progress]}
             :inactive_sections {:lualine_a [:mode]
                                 :lualine_b {}
                                 :lualine_c {}
                                 :lualine_x {}
                                 :lualine_y {}
                                 :lualine_z [:location :progress]}
             :extensions [:oil :mason]})

(local dependencies [:arkav/lualine-lsp-progress])

{1 :nvim-lualine/lualine.nvim
 :event [:BufReadPost :BufNewFile]
 : opts
 : dependencies}
