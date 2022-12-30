;; Lazy opts.
(module config.lazy {autoload {util config.util}})

(def- opts {:defaults {:lazy true :version "*"}
            :install {:colorscheme [:no-clown-fiesta]}
            :checker {:enabled true}
            :performance {:rtp {:disabled_plugins [:gzip
                                                   :matchit
                                                   :matchparen
                                                   :netrwPlugin
                                                   :tarPlugin
                                                   :tohtml
                                                   :tutor
                                                   :zipPlugin]}}})
