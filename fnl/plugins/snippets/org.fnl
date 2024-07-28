;; Snippets for org files.

(λ add-snippets []
  (let [ls (require :luasnip)
        fmt (require :luasnip.extras.fmt)]
    (let [s ls.s
          i ls.insert_node
          fmt fmt.fmt]
      (ls.add_snippets :org
                       [(s :be
                           (fmt "#+begin_src {}\n{}\n#+end_src" [(i 1) (i 2)]))]))))

{: add-snippets}
