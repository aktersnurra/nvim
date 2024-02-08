(local keys [{1 :ge 2 ":IncRename " :mode :n :desc :Rename}])

{1 :smjonas/inc-rename.nvim
 : keys
 :config (fn []
           (let [inc-rename (require :inc_rename)]
             (inc-rename.setup)))}
