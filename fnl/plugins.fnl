;; List of plugins.
(module plugins)

(def color [{1 :aktersnurra/no-clown-fiesta.nvim
             :config (fn []
                       (require :config.colorscheme))}
            {1 :norcalli/nvim-colorizer.lua
             :config (fn []
                       (require :config.colorizer))
             :event :BufRead}
            {1 :nvim-treesitter/nvim-treesitter
             :config (fn []
                       (require :config.treesitter))
             :run ":TSUpdate"}])

(def completions {1 :hrsh7th/nvim-cmp
                  :requires [{1 :hrsh7th/cmp-buffer}
                             {1 :onsails/lspkind-nvim}
                             {1 :hrsh7th/cmp-nvim-lsp}
                             {1 :hrsh7th/cmp-cmdline}
                             {1 :L3MON4D3/LuaSnip}
                             {1 :hrsh7th/cmp-path}
                             {1 :saadparwaiz1/cmp_luasnip}
                             {1 :f3fora/cmp-spell}]
                  :event :InsertEnter
                  :want :Luasnip
                  :config (fn []
                            (require :config.cmp))})

(def core [{1 :Olical/aniseed}
           {1 :lewis6991/impatient.nvim}
           {1 :wbthomason/packer.nvim}])

(def git [{1 :sindrets/diffview.nvim
           :config (fn []
                     (require :config.diffview))
           :event :BufRead}
          {1 :TimUntersberger/neogit
           :config (fn []
                     (require :config.neogit))
           :event :BufRead
           :requires [:nvim-lua/plenary.nvim]}
          {1 :lewis6991/gitsigns.nvim
           :config (fn []
                     (require :config.gitsigns))
           :event :BufRead}])

(def lsp [{1 :j-hui/fidget.nvim
           :event :BufWinEnter
           :config (fn []
                     (require :config.fidget))}
          {1 :jose-elias-alvarez/null-ls.nvim}
          {1 :neovim/nvim-lspconfig}
          {1 :williamboman/mason.nvim
           :event :BufWinEnter
           :config (fn []
                     (require :config.lsp.mason))}
          {1 :tamago324/nlsp-settings.nvim}
          {1 :jayp0521/mason-null-ls.nvim
           :event :BufWinEnter
           :config (fn []
                     (require :config.lsp.null-ls)
                     (require :config.lsp.mason-null-ls))
           :requires [:jose-elias-alvarez/null-ls.nvim
                      :williamboman/mason.nvim]
           :after :mason.nvim}
          {1 :b0o/SchemaStore.nvim}
          {1 :williamboman/mason-lspconfig.nvim
           :event :BufWinEnter
           :config (fn []
                     (require :config.lsp.mason-lspconfig)
                     (let [handlers (require :config.lsp.handlers)]
                       (handlers.setup)))
           :requires [:neovim/nvim-lspconfig :williamboman/mason.nvim]
           :after :mason.nvim}
          {1 :folke/trouble.nvim
           :config (fn []
                     (require :config.trouble))
           :event :BufWinEnter}])

(def misc [{1 :nvim-orgmode/orgmode
            :config (fn []
                      (require :config.orgmode))
            :requires :nvim-treesitter/nvim-treesitter
            :event :BufWinEnter}
           {1 :akinsho/toggleterm.nvim
            :config (fn []
                      (require :config.toggleterm))
            :event :BufWinEnter}
           {1 :dstein64/vim-startuptime}])

(def search [{1 :nvim-telescope/telescope-fzf-native.nvim :run :make}
             {1 :nvim-telescope/telescope-frecency.nvim
              :requires :tami5/sqlite.lua}
             {1 :nvim-telescope/telescope.nvim
              :config (fn []
                        (require :config.telescope))
              :requires [:nvim-lua/popup.nvim
                         :nvim-lua/plenary.nvim
                         :nvim-telescope/telescope-fzf-native.nvim
                         :nvim-telescope/telescope-frecency.nvim]}
             {1 :ggandor/leap.nvim
              :config (fn []
                        (require :config.leap))
              :event :BufRead}
             {1 :ggandor/flit.nvim
              :config (fn []
                        (require :config.flit))
              :after :leap.nvim
              :event :BufRead}
             {1 :ahmedkhalf/project.nvim
              :config (fn []
                        (require :config.project))}
             {1 :tamago324/lir.nvim
              :config (fn []
                        (require :config.lir))
              :requires [:kyazdani42/nvim-web-devicons]}
             {1 :ThePrimeagen/harpoon
              :config (fn []
                        (require :config.harpoon))}])

(def session {1 :rmagatti/auto-session
              :config (fn []
                        (require :config.auto-session))
              :requires [:rmagatti/session-lens]})

(def snippets [:rafamadriz/friendly-snippets])

(def text [{1 :numToStr/Comment.nvim
            :config (fn []
                      (require :config.comment))
            :event :BufWinEnter}
           {1 :JoosepAlviste/nvim-ts-context-commentstring :event :BufReadPost}
           {1 :kylechui/nvim-surround
            :config (fn []
                      (require :config.surround))
            :event :BufRead}
           {1 :gbprod/stay-in-place.nvim
            :event :BufWinEnter
            :config (fn []
                      (require :config.stay-in-place))}
           {1 :junegunn/vim-slash
            :config (fn []
                      (require :config.vim-slash))
            :event :BufWinEnter}
           {1 :cappyzawa/trim.nvim
            :config (fn []
                      (require :config.trim))
            :event :BufWinEnter}
           {1 :max397574/better-escape.nvim
            :event :BufWinEnter
            :config (fn []
                      (require :config.better-escape))}
           {1 :windwp/nvim-autopairs
            :config (fn []
                      (require :config.autopairs))
            :event :BufWinEnter}
           {1 :windwp/nvim-spectre
            :config (fn []
                      (require :config.spectre))
            :event :BufWinEnter}])

(def ui [{1 :nvim-lualine/lualine.nvim
          :event :BufWinEnter
          :config (fn []
                    (require :config.lualine))
          :requires [:kyazdani42/nvim-web-devicons]}
         {1 :aktersnurra/minibar.nvim
          :config (fn []
                    (require :config.minibar))
          :event :BufRead}
         {1 :folke/zen-mode.nvim
          :config (fn []
                    (require :config.zen))
          :event :BufWinEnter}
         {1 :kevinhwang91/nvim-bqf
          :config (fn []
                    (require :config.bqf))
          :event :BufRead}
         {1 :s1n7ax/nvim-window-picker
          :config (fn []
                    (require :config.window-picker))
          :event :BufWinEnter}
         {1 :luukvbaal/stabilize.nvim
          :config (fn []
                    (require :config.stabilize))
          :event :BufWinEnter}
         {1 :moll/vim-bbye :event :BufWinEnter}
         {1 :folke/which-key.nvim
          :config (fn []
                    (require :config.which-key))
          :event :BufWinEnter}])

(def all {: color
          : completions
          : core
          : git
          : lsp
          : misc
          : search
          : session
          : snippets
          : text
          : ui})
