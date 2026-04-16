;; Sets options in neovim

(import-macros {: set-opts} :macros)

(local spellfile (.. (os.getenv :XDG_CONFIG_HOME) :/nvim/spell/en.utf-8.add))

(set-opts {:backup false
           :clipboard :unnamedplus
           :cmdheight 1
           :completeopt {:menuone :noselect}
           :conceallevel 0
           :fileencoding :utf-8
           :hlsearch true
           :ignorecase true
           :mouse ""
           :pumheight 10
           :showmode false
           :showtabline 0
           :smartcase true
           :smartindent true
           :splitbelow true
           :splitright true
           :swapfile false
           :termguicolors true
           :timeoutlen 1000
           :undofile true
           :updatetime 1000
           :writebackup false
           :expandtab true
           :shiftwidth 2
           :tabstop 2
           :cursorline true
           :number true
           :relativenumber true
           :numberwidth 2
           :signcolumn :yes
           :wrap false
           :laststatus 3
           :autoread true
           :scrolloff 8
           :sidescrolloff 8
           :colorcolumn :88
           :shortmess :filnxtToOFWIcC
           :spell true
           : spellfile
           :spelllang [:en_us]
           :guifont "monospace:h17"
           :splitkeep :screen
           :inccommand :split
           :winborder :single
           :shada ["'10" :<0 :s10 :h]})

(vim.opt.jumpoptions:append :stack)

;; Move to new line when reaching the beginning or end.
(vim.opt.whichwrap:append "<,>,[,],h,l")
(vim.opt.shortmess:append {:C true})

(set vim.g.mapleader " ")
(set vim.g.maplocalleader " ")
(set vim.g.markdown_recommended_style 0)
