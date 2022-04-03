;; Configuration for completion plugin.
(module config.cmp
  {autoload {nvim aniseed.nvim
             util util}})

(local luasnip (let [(ok? luasnip) util.load-plugin :luasnip]
  (when ok?
    ((require :luasnip/loaders/from_vscode).lazy_load)
    luasnip)))

(local lspkind (let [(ok? lspkind) util.load-plugin :lspkind]
  (when ok?
    lspkind)))

(lspkind.init)

(defn- snip [args]
  (luasnip.lsp_expand args.body)

(let [(ok? cmp) util.load-plugin :cmp]
  (when ok?
    (cmp.setup {
      :snippet {
          :expand snip}
      :mapping {
          "<C-k>" (cmp.mapping.select_prev_item)
          "<C-j>" (cmp.mapping.select_next_item)}
      :sources [
        {:name "nvim_lsp"}
        {:name "nvim_lua"}
        {:name "luasnip"}
        {:name "buffer" :keyword_length 4}
        {:name "path" :keyword_length 6}]
      :formatting {:format (lspkind.cmp_format {
          :with_text true
          :menu {
              :buffer "[Buf]"
              :nvim_lsp "[LSP]"
              :nvim_lua "[api]"
              :path "[path]"
              :luasnip "[Snip]"
            }})}
      :documentation {
        :border [ "╭" "─" "╮" "│" "╯" "─" "╰" "│" ]}
      :experimental {
        :ghost_text false
        :native_menu false}})))
