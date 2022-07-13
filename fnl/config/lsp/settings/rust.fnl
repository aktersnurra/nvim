;; Configuration for rust langauage server.
(module config.lsp.settings.rust)

(def opts
     {:settings {:rust-analyzer {:lens {:enable true}
                                 :checkOnSave {:command :clippy}}}})
