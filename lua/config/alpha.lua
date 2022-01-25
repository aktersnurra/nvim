-- A customizable greeter.

local status_ok, alpha = pcall(require, "alpha")
if not status_ok then
  return
end

local dashboard = require "alpha.themes.dashboard"
dashboard.section.header.val = {
  [[     ##############..... ############## ]],
  [[   ##############......##############   ]],
  [[     ##########..........##########     ]],
  [[     ##########........##########       ]],
  [[     ##########.......##########        ]],
  [[     ##########.....##########..        ]],
  [[     ##########....##########.....      ]],
  [[   ..##########..##########.........    ]],
  [[ ....##########.#########.............  ]],
  [[   ..################JJJ............    ]],
  [[     ################.............      ]],
  [[     ##############.JJJ.JJJJJJJJJJ      ]],
  [[     ############...JJ...JJ..JJ  JJ     ]],
  [[     ##########....JJ...JJ..JJ  JJ      ]],
  [[     ########......JJJ..JJJ JJJ JJJ     ]],
  [[    ######    .........                 ]],
  [[                 .....                  ]],
  [[                   .                    ]],
}
dashboard.section.buttons.val = {
  dashboard.button("f", "  Find file", ":Telescope file_browser <CR>"),
  dashboard.button("e", "  New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("p", "  Find project", ":Telescope projects <CR>"),
  dashboard.button("r", "  Recently used files", ":Telescope oldfiles <CR>"),
  dashboard.button("t", "  Find text", ":Telescope live_grep <CR>"),
  dashboard.button("c", "  Configuration", ":e ~/.config/nvim/init.lua <CR>"),
  dashboard.button("q", "  Quit Neovim", ":qa<CR>"),
}

dashboard.section.footer.opts.hl = "PmenuThumb"
dashboard.section.header.opts.hl = "PmenuThumb"
dashboard.section.buttons.opts.hl = "PmenuThumb"

dashboard.opts.opts.noautocmd = true
alpha.setup(dashboard.opts)
