;; Display colors of hex numbers.

(local keys [{1 :<leader>h 2 :<cmd>ColorizerToggle<cr> :desc :Colorizer}])

{1 :norcalli/nvim-colorizer.lua :cmd :ColorizerToggle :config true : keys}
