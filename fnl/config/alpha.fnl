;; A customizable greeter.
(module config.alpha
  {autoload {util util}})

(def- ascii-art {
  "     ##############..... ############## ",
  "   ##############......##############   ",
  "     ##########..........##########     ",
  "     ##########........##########       ",
  "     ##########.......##########        ",
  "     ##########.....##########..        ",
  "     ##########....##########.....      ",
  "   ..##########..##########.........    ",
  " ....##########.#########.............  ",
  "   ..################JJJ............    ",
  "     ################.............      ",
  "     ##############.JJJ.JJJJJJJJJJ      ",
  "     ############...JJ...JJ..JJ  JJ     ",
  "     ##########....JJ...JJ..JJ  JJ      ",
  "     ########......JJJ..JJJ JJJ JJJ     ",
  "    ######    .........                 ",
  "                 .....                  ",
  "                   .                    ",
})

(let [(ok? alpha) util.load-plugin :alpha]
  (when ok?
    (let [dashboard (require :alpha.themes.dashboard)]
      (do
        (dashboard.section.header.val ascii-art)
        (dashboard.section.buttons.val {
          (dashboard.button "f" "  Find file" ":Telescope file_browser <CR>")
          (dashboard.button "e" "  New file" ":ene <BAR> startinsert <CR>")
          (dashboard.button "p" "  Find project" ":Telescope projects <CR>")
          (dashboard.button "r" "  Recently used files" ":Telescope oldfiles <CR>")
          (dashboard.button "t" "  Find text" ":Telescope live_grep <CR>")
          (dashboard.button "c" "  Configuration" ":e ~/.config/nvim/init.lua <CR>")
          (dashboard.button "q" "  Quit Neovim" ":qa<CR>")
        }
        (dashboard.section.header.opts.hl :AlphaHeader)
        (dashboard.section.buttons.opts.hl :AlphaButtons)
        (dashboard.opts.opts.noautocmd true)
        (alpha.setup {dashboard.opts}))))))
