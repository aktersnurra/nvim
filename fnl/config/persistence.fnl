;; Session manager.
(module config.persistence {autoload {util config.util}})

(def- opts {:options [:buffers :curdir :tabpages :winsize :help]})

(util.setup :persistence opts)
