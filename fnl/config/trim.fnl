;; Trim whitespaces on save.

(local opts {:disable [:python]})

{1 :cappyzawa/trim.nvim :event :BufFilePre :config opts}
