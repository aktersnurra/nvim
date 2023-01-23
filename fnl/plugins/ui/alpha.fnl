;; A customizable greeter.

(local ascii-art ["     ##############..... ############## "
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

(fn setup []
  (let [alpha (require :alpha)]
    (let [dashboard (require :alpha.themes.dashboard)]
      (set dashboard.section.header.val ascii-art)
      (set dashboard.section.buttons.val
           [(dashboard.button :e "  New file" ":ene <BAR> startinsert <CR>")
            (dashboard.button :f "  Find file"
                              ":Telescope find_files theme=dropdown<CR>")
            (dashboard.button :t "  Find text"
                              ":Telescope live_grep theme=dropdown<CR>")
            (dashboard.button :p "  Find project"
                              ":Telescope projects theme=dropdown<CR>")
            (dashboard.button :r "  Recently used files"
                              ":Telescope oldfiles theme=dropdown<CR>")
            (dashboard.button :c "  Configuration"
                              ":e ~/.config/nvim/init.lua <CR>")
            (dashboard.button :q "  Quit Neovim" ":qa<CR>")])
      (set dashboard.section.header.opts.hl :AlphaHeader)
      (set dashboard.section.buttons.opts.hl :AlphaButtons)
      (set dashboard.opts.opts.noautocmd true)
      (alpha.setup dashboard.opts))))

{1 :goolord/alpha-nvim
 :event :VimEnter
 :config (fn []
           (setup))}