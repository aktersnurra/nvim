;; Enable spell checking in comments.
(module config.spellsitter {autoload {: util}})

(let [spellsitter (util.load-plugin :spellsitter)]
  (spellsitter.setup {:enable true :debug false}))
