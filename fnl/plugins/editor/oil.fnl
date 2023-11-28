;; File explorer that lets you edit your filesystem.

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

(fn config []
  (let [oil (require :oil)]
    (oil.setup {: keymaps})
    (vim.keymap.set :n "-" (fn []
                             (oil.open))
                    {:desc "Open parent directory"})))

{1 :stevearc/oil.nvim : config :event :VeryLazy}
