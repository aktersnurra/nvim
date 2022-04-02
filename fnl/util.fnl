;; Utility functions.
(module util)

(defn load-plugin [name]
  (let [(ok? val-or-err) (pcall require name)]
    (when ok?
      (val-or-err))
    (when (not ok?)
      (print "Could not load config: " val-or-err))))

