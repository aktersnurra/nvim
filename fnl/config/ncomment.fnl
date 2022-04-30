;; Language aware commenting.
(module config.ncomment
  {autoload {util util}})

(defn- get-type [ctx U]
  (if (= ctx.ctype U.ctype.line)
    :__default
    :__multiline))

(defn- get-location [ctx U]
  (let [utils (require :ts_context_commentstring.utils)]
    (if (= ctx.ctype U.ctype.block)
      (utils.get_cursor_location)
      (or (= ctx.cmotion U.cmotion.v) (= ctx.cmotion U.cmotion.V))
      (utils.get_visual_start_location)
      nil)))

(defn- pre-hook [ctx]
  (let [U (require :Comment.utils)
        internal (require :ts_context_commentstring.internal)]
    (internal.calculate_commentstring
      {:key (get-type ctx U)
       :location (get-location ctx U)})))

(let [ncomment (util.load-plugin :Comment)]
  (ncomment.setup
    {:pre_hook (fn [ctx]
                  (pre-hook ctx))}))
