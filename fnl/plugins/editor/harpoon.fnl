;; Harpoon files for navigation.

(fn telescope-ext [ext fun opts]
  (let [telescope (require :telescope)
        themes (require :telescope.themes)
        theme (. opts :theme)]
    ((. (. (. telescope :extensions) ext) fun) ((. themes theme) opts))))

(fn setup []
  (vim.keymap.set :n :<tab>
                  (fn []
                    (telescope-ext :harpoon :marks
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
