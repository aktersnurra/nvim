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
                  {})
  {:menu {:width (- (vim.api.nvim_win_get_width 0) 4)}})

{1 :ThePrimeagen/harpoon
 :event :BufReadPost
 :keys [{1 :ma 2 :<cmd>HarpoonAdd<cr> :desc :Harpoon}
        {1 :mr 2 :<cmd>HarpoonUI<cr> :desc "Harpoon UI"}
        {1 :ms 2 :<cmd>HarpoonPrev<cr> :desc "Harpoon Prev"}
        {1 :mt 2 :<cmd>HarpoonNext<cr> :desc "Harpoon Next"}]
 :config (fn []
           (setup))}
