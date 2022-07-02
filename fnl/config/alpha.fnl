;; A customizable greeter.
(module config.alpha {autoload {util util}})

(def- ascii-art ["     ##############..... ############## "
                 "   ##############......##############   "
                 "     ##########..........##########     "
                 "     ##########........##########       "
                 "     ##########.......##########        "
                 "     ##########.....##########..        "
                 "     ##########....##########.....      "
                 "   ..##########..##########.........    "
                 " ....##########.#########.............  "
                 "   ..################JJJ............    "
                 "     ################.............      "
                 "     ##############.JJJ.JJJJJJJJJJ      "
                 "     ############...JJ...JJ..JJ  JJ     "
                 "     ##########....JJ...JJ..JJ  JJ      "
                 "     ########......JJJ..JJJ JJJ JJJ     "
                 "    ######    .........                 "
                 "                 .....                  "
                 "                   .                    "])

(let [alpha (util.load-plugin :alpha)]
  (let [dashboard (require :alpha.themes.dashboard)]
    (set dashboard.section.header.val ascii-art)
    (set dashboard.section.buttons.val
         [(dashboard.button :f "  Find file" ":lua require'lir.float'.toggle()<CR>")
          (dashboard.button :e "  New file" ":ene <BAR> startinsert <CR>")
          (dashboard.button :p "  Find project" ":Telescope projects <CR>")
          (dashboard.button :r "  Recently used files"
                            ":Telescope oldfiles <CR>")
          (dashboard.button :t "  Find text" ":Telescope live_grep <CR>")
          (dashboard.button :c "  Configuration"
                            ":e ~/.config/nvim/init.lua <CR>")
          (dashboard.button :q "  Quit Neovim" ":qa<CR>")])
    (set dashboard.section.header.opts.hl :AlphaHeader)
    (set dashboard.section.buttons.opts.hl :AlphaButtons)
    (set dashboard.opts.opts.noautocmd true)
    (alpha.setup dashboard.opts)))
