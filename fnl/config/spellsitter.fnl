;; Enable spell checking in comments.
(module config.spellsitter {autoload {util util}})

(let [spellsitter (util.load-plugin :spellsitter)]
  (spellsitter.setup {:enable true :debug false}))
