;; File explorer that lets you edit your filesystem.

(local user-cmds [[:Oil
                   (lambda []
                     (let [oil (require :oil)]
                       (oil.open)))
                   {:nargs 0}]])

(local keymaps {:g? :actions.show_help
                :<CR> :actions.select
                :<C-s> :actions.select_vsplit
                :<C-h> :actions.select_split
                :<C-t> :actions.select_tab
                :<C-p> :actions.preview
                :<C-c> :actions.close
                :<C-l> :actions.refresh
                :- :actions.parent
                :_ :actions.open_cwd
                "`" :actions.cd
                "~" :actions.tcd
                :gs :actions.change_sort
                :gx :actions.open_external
                :g. :actions.toggle_hidden
                "g\\\\" :actions.toggle_trash})

(local keys [{1 "-" 2 :<cmd>Oil<cr> :desc "Open parent directory"}])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-user-cmds user-cmds)))

(fn config []
  (let [oil (require :oil)]
    (oil.setup {: keymaps})))

{1 :stevearc/oil.nvim : init : config : keys}
