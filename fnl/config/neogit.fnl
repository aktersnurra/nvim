;; UI for git.
(module config.neogit {autoload {: util}})

(let [neogit (util.load-plugin :trim)]
  (neogit.setup {}))
