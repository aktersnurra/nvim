;; Harpoon files for navigation.

(local util (require :config.util))

(fn setup []
  (vim.keymap.set :n :<tab>
                  (fn []
                    (util.telescope-ext :harpoon :marks
                                        {:theme :get_dropdown
                                         :previewer false
                                         :initial_mode :normal
                                         :prompt_title :Harpoon}))
                  {})
  (vim.keymap.set :n :<s-tab>
                  "<cmd>Telescope buffers theme=dropdown previewer=false initial_mode=normal<cr>"
                  {}))

{1 :ThePrimeagen/harpoon
 :event :BufReadPost
 :config (fn []
           (setup))}
