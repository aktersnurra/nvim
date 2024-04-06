;; Harpoon files for navigation.

(local opts {:ui_max_width 64 :title " ⇁  "})

(local user-cmds [[:HarpoonAdd
                   (lambda []
                     (let [harpoon (require :harpoon)]
                       (: (harpoon:list) :add)))
                   {:nargs 0}]
                  [:HarpoonUI
                   (lambda []
                     (let [harpoon (require :harpoon)]
                       (harpoon.ui:toggle_quick_menu (harpoon:list) opts)))
                   {:nargs 0}]])

(lambda select [nr]
  (let [harpoon (require :harpoon)]
    (: (harpoon:list) :select nr)))

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-user-cmds user-cmds)))

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

{1 :ThePrimeagen/harpoon :branch :harpoon2 :event :BufReadPost : init : keys}
