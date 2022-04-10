;; Config for pyright language server.
(module config.lsp.settings.pyright)

(def settings 
  {:settings 
   {:python 
    {:analysis
     {:typeCheckingMode "off"}}}})
