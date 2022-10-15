;; fFtT motions on roids.
(module config.flit {autoload {:util :config.util nvim aniseed.nvim}})

(def- opts {:keys {:f :f :F :F :t :t :T :T}
            :labeled_modes :v
            :multiline true
            :opts {}})

(util.setup :flit opts)
