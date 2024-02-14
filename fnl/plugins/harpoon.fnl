;; Harpoon files for navigation.

(local user-cmds [[:HarpoonAdd
                   (lambda []
                     (let [harpoon (require :harpoon)]
                       (: (harpoon:list) :append)))
                   {:nargs 0}]
                  [:HarpoonUI
                   (lambda []
                     (let [harpoon (require :harpoon)]
                       (harpoon.ui:toggle_quick_menu (harpoon:list))))
                   {:nargs 0}]])

(fn telescope-ext [ext fun opts]
  (let [telescope (require :telescope)
        themes (require :telescope.themes)
        theme (. opts :theme)]
    ((. (. (. telescope :extensions) ext) fun) ((. themes theme) opts))))

(lambda select [nr]
  (let [harpoon (require :harpoon)]
    (: (harpoon:list) :select nr)))

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-user-cmds user-cmds)))

(fn config []
  (vim.keymap.set :n :<tab>
                  (fn []
                    (telescope-ext :harpoon :marks
                                   {:theme :get_dropdown
                                    :previewer false
                                    :initial_mode :normal
                                    :prompt_title :Harpoon}))
                  {})
  {:menu {:width (- (vim.api.nvim_win_get_width 0) 4)}})

(local keys [{1 :ma 2 :<cmd>HarpoonAdd<cr> :desc :Harpoon}
             {1 :mr 2 :<cmd>HarpoonUI<cr> :desc "Harpoon UI"}
             {1 :ms
              2 (fn []
                  (select 1))
              :desc "First Harpoon"}
             {1 :mt
              2 (fn []
                  (select 2))
              :desc "Second Harpoon"}
             {1 :mn
              2 (fn []
                  (select 3))
              :desc "Third Harpoon"}
             {1 :me
              2 (fn []
                  (select 4))
              :desc "Fourth Harpoon"}])

{1 :ThePrimeagen/harpoon
 :branch :harpoon2
 :event :BufReadPost
 : init
 : keys
 : config}
