;; Session manager.

(local keys [{1 :<leader>sn 2 :<cmd>RestoreSession<cr> :desc "Restore session"}
             {1 :<leader>se
              2 :<cmd>RestoreLastSession<cr>
              :desc "Restore last session"}
             {1 :<leader>si
              2 :<cmd>IgnoreSession<cr>
              :desc "Ignore current session"}])

(local user-cmds [[:RestoreSession
                   (lambda []
                     (let [persistence (require :persistence)]
                       (persistence.load)))
                   {:nargs 0}]
                  [:RestoreLastSession
                   (lambda []
                     (let [persistence (require :persistence)]
                       (persistence.load {:last true})))
                   {:nargs 0}]
                  [:IgnoreSession
                   (lambda []
                     (let [persistence (require :persistence)]
                       (persistence.stop)))
                   {:nargs 0}]])

(fn init []
  (let [cmds (require :util.cmds)]
    (cmds.create-user-cmds user-cmds)))

(local opts {:options [:buffers :curdir :tabpages :winsize :help]})

{1 :folke/persistence.nvim :event :VeryLazy : init : keys : opts}
