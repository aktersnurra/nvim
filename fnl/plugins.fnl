;; List of plugins.
(module plugins)

(def color [{1 :aktersnurra/no-clown-fiesta.nvim
             :config (fn []
                       (require :config.colorscheme))}
            {1 :norcalli/nvim-colorizer.lua
             :cmd :ColorizerToggle
             :config (fn []
                       (require :config.colorizer))}
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
                  :config (fn []
                            (require :config.cmp))})

(def core [{1 :Olical/aniseed}
           {1 :lewis6991/impatient.nvim}
           {1 :wbthomason/packer.nvim}])

(def git [{1 :sindrets/diffview.nvim
           :cmd [:DiffviewFileHistory :DiffviewOpen]
           :config (fn []
                     (require :config.diffview))}
          {1 :TimUntersberger/neogit
           :cmd :Neogit
           :requires [:nvim-lua/plenary.nvim]
           :config (fn []
                     (require :config.neogit))}
          {1 :lewis6991/gitsigns.nvim
           :event :BufRead
           :config (fn []
                     (require :config.gitsigns))}])

(def lsp [{1 :williamboman/mason.nvim
           :event :BufReadPre
           :config (fn []
                     (require :config.lsp.mason))}
          {1 :tamago324/nlsp-settings.nvim}
          {1 :jayp0521/mason-null-ls.nvim
           :after :mason.nvim
           :event :BufReadPre
           :requires [:jose-elias-alvarez/null-ls.nvim
                      :williamboman/mason.nvim]
           :config (fn []
                     (require :config.lsp.null-ls)
                     (require :config.lsp.mason-null-ls))}
          {1 :b0o/SchemaStore.nvim}
          {1 :williamboman/mason-lspconfig.nvim
           :event :BufReadPre
           :config (fn []
                     (require :config.lsp.mason-lspconfig)
                     (let [handlers (require :config.lsp.handlers)]
                       (handlers.setup)))
           :requires [:neovim/nvim-lspconfig :williamboman/mason.nvim]
           :after :mason.nvim}
          {1 :folke/trouble.nvim
           :cmd :TroubleToggle
           :config (fn []
                     (require :config.trouble))}])

(def misc [{1 :nvim-orgmode/orgmode
            :event :BufWinEnter
            :config (fn []
                      (require :config.orgmode))}
           {1 :moll/vim-bbye :event :BufRead}
           {1 :akinsho/toggleterm.nvim
            :cmd :ToggleTerm
            :config (fn []
                      (require :config.toggleterm))}
           {1 :dstein64/vim-startuptime :cmd :StartupTime}])

(def search [{1 :nvim-telescope/telescope-fzf-native.nvim :run :make}
             {1 :nvim-telescope/telescope-frecency.nvim
              :requires :tami5/sqlite.lua}
             {1 :nvim-telescope/telescope.nvim
              :event :VimEnter
              :config (fn []
                        (require :config.telescope))
              :requires [:nvim-lua/popup.nvim
                         :nvim-lua/plenary.nvim
                         :nvim-telescope/telescope-fzf-native.nvim
                         :nvim-telescope/telescope-frecency.nvim]}
             {1 :ggandor/leap.nvim
              :event :BufWinEnter
              :config (fn []
                        (require :config.leap))}
             {1 :ggandor/flit.nvim
              :event :BufWinEnter
              :config (fn []
                        (require :config.flit))}
             {1 :ahmedkhalf/project.nvim
              :event :BufWinEnter
              :requires :nvim-telescope/telescope.nvim
              :config (fn []
                        (require :config.project))}
             {1 :windwp/nvim-spectre
              ;; :cmd [:Replace :ReplaceWord :ReplaceInBuf]
              :event :BufWinEnter
              :config (fn []
                        (require :config.spectre))}
             {1 :junegunn/vim-slash
              :event :BufWinEnter
              :config (fn []
                        (require :config.vim-slash))}
             {1 :ThePrimeagen/harpoon
              :event :BufWinEnter
              ;; :cmd [:HapoonAdd :HapoonNext :HapoonPrev :HarpoonUI]
              :requires :nvim-telescope/telescope.nvim
              :config (fn []
                        (require :config.harpoon))}])

(def session {1 :rmagatti/auto-session
              :event :VimEnter
              :after :telescope.nvim
              :requires [:rmagatti/session-lens :nvim-telescope/telescope.nvim]
              :config (fn []
                        (require :config.auto-session))})

(def snippets [:rafamadriz/friendly-snippets])

(def text [{1 :numToStr/Comment.nvim
            :event :BufWinEnter
            ;; :cmd [:CommentNormal :CommentVisual]
            :config (fn []
                      (require :config.comment))}
           {1 :JoosepAlviste/nvim-ts-context-commentstring :event :BufReadPost}
           {1 :kylechui/nvim-surround
            :event :InsertEnter
            :config (fn []
                      (require :config.surround))}
           {1 :gbprod/stay-in-place.nvim
            :event :InsertEnter
            :config (fn []
                      (require :config.stay-in-place))}
           {1 :cappyzawa/trim.nvim
            :event :BufFilePre
            :config (fn []
                      (require :config.trim))}
           {1 :max397574/better-escape.nvim
            :event :BufWinEnter
            :config (fn []
                      (require :config.better-escape))}
           {1 :windwp/nvim-autopairs
            :event :InsertEnter
            :config (fn []
                      (require :config.autopairs))}
           {1 :mbbill/undotree :cmd :UndotreeToggle}])

(def ui [{1 :nvim-lualine/lualine.nvim
          :event :BufReadPre
          :config (fn []
                    (require :config.lualine))
          :requires [:kyazdani42/nvim-web-devicons]}
         {1 :arkav/lualine-lsp-progress}
         {1 :aktersnurra/minibar.nvim
          :event :BufRead
          :config (fn []
                    (require :config.minibar))}
         {1 :folke/zen-mode.nvim
          :cmd :ZenMode
          :config (fn []
                    (require :config.zen))}
         {1 :kevinhwang91/nvim-bqf
          :event :BufWinEnter
          :config (fn []
                    (require :config.bqf))}
         {1 :s1n7ax/nvim-window-picker
          :event :WinNew
          :config (fn []
                    (require :config.window-picker))}
         {1 :luukvbaal/stabilize.nvim
          :event :BufWinEnter
          :config (fn []
                    (require :config.stabilize))}
         {1 :folke/which-key.nvim
          :event :BufWinEnter
          :config (fn []
                    (require :config.which-key))}])

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
