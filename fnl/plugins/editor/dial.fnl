;; Better incrementation/decrementation.

(local keys [{1 :<C-a>
              2 (fn []
                  (let [dial (require :dial.map)]
                    (dial.inc_normal)))
              :expr true
              :desc :Increment}
             {1 :<C-x>
              2 (fn []
                  (let [dial (require :dial.map)]
                    (dial.dec_normal)))
              :expr true
              :desc :Decrement}])

(fn config []
  (let [cfg (require :dial.config)
        augend (require :dial.augend)]
    (cfg.augends:register_group
                      {:default [augend.integer.alias.decimal
                                 augend.integer.alias.hex
                                 (. augend.date.alias "%Y-%m-%d")
                                 augend.constant.alias.bool
                                 augend.semver.alias.semver]})))

{1 :monaqa/dial.nvim : keys : config}
