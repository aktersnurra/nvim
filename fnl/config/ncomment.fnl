;; Language aware commenting.
(module config.ncomment
  {autoload {util util}})


(defn- get-type [ctx U]
  (or (and (= ctx.ctype U.ctype.line) :__default) :__multiline))

(defn- get-location [ctx U]
  (if (= ctx.ctype U.ctype.block)
    ((require :ts_context_commentstring.utils).get_cursor_location)
    (or (= ctx.motion U.motion.v) (= ctx.motion U.cmotion.V))
    ((require :ts_context_commentstring.utils).get_visual_start_location)
    (nil)))

(defn- pre-hook [ctx]
  (let [U (require :Comment.utils)]
    ((require :ts_context_commentstring.internal).calculate_commentstring {
        :key (get-type ctx U)
        :location (get-location ctx U)})))

(let [ncomment (util.load-plugin :Comment)]
  (ncomment.setup 
    {:pre_hook (fn [ctx]
                   (pre-hook ctx))}))
