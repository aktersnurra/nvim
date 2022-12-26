;; A neovim orgmode.
(module config.neorg {autoload {util config.util}})

(def- opts
      {:load {:core.defaults []
              :core.norg.dirman {:config {:workspaces {:work "~/.local/share/neorg/work"
                                                       :home "~/.local/share/neorg/home"}}}}})

(util.setup :neorg opts)
