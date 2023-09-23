;; Delete buffers.

(local keys [{1 :<leader><BS> 2 :<cmd>BufDel<CR> :desc "Close Buffer"}])

{1 :ojroques/nvim-bufdel :cmd :BufDel : keys}
