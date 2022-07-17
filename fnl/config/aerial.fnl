;; Skimming code.
(module config.aerial {autoload {: util}})

(let [aerial (util.load-plugin :aerial)]
  (aerial.setup {}))
