;; Config for pyright language server.
(module config.lsp.settings.pyright)

(def opts
  {:settings
   {:python
    {:analysis
     {:typeCheckingMode :off}}}})
