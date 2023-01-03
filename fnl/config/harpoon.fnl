;; Harpoon files for navigation.
(module config.harpoon {autoload {util config.util nvim aniseed.nvim}})

(def- opts {})

(util.setup :harpoon opts)

(vim.keymap.set :n :<tab>
                (fn []
                  (util.telescope-ext :harpoon :marks
                                      {:theme :get_dropdown
                                       :previewer false
                                       :initial_mode :normal
                                       :prompt_title :Harpoon}))
                {})

(nvim.set_keymap :n :<s-tab>
                 "<cmd>Telescope buffers theme=dropdown previewer=false initial_mode=normal<cr>"
                 {})
