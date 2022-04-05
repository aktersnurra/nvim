;; Utility functions.
(module util)

(defn load-plugin [name]
  (let [(ok? val-or-err) (pcall require name)]
    (if ok?
      (val-or-err)
      (print "Could not load config: " val-or-err))))

