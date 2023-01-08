;; Session manager.

(local opts {:options [:buffers :curdir :tabpages :winsize :help]})

{1 :folke/persistence.nvim :event :VeryLazy :opts opts}
