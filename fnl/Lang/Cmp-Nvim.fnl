(module Lang.Cmp-Nvim
  {autoload {cmp cmp}
   autoload {dictionary cmp_dictionary}
   autoload {comparator cmp-under-comparator}
   autoload {luasnip luasnip}})

(def- kind-icons
  {
   :Text  ""
   :Method  "m"
   :Function  ""
   :Constructor  ""
   :Field  ""
   :Variable  ""
   :Class  ""
   :Interface  ""
   :Module  ""
   :Property  ""
   :Unit  ""
   :Value  ""
   :Enum  ""
   :Keyword  ""
   :Snippet  ""
   :Color  ""
   :File  ""
   :Reference  ""
   :Folder  ""
   :EnumMember  ""
   :Constant  ""
   :Struct  ""
   :Event  ""
   :Operator  ""
   :TypeParameter  ""})

(def- kind-menu
  {:nvim_lsp "[LSP]"
   :luasnip "[Snippet]"
   :calc "[Calc]"
   :greek "[Greek]"
   :latex_symbols "[Symbol]"
   :treesitter "[TS]"
   :dictionary "[Dict]"
   :buffer "[File]"
   :path "[Path]"})

(cmp.setup
  {:snippet {:expand (fn [args] (luasnip.lsp_expand (. args :body)))}
   :sources (cmp.config.sources 
              [
               {:name "nvim_lsp"}
               {:name "nvim_lua"}
               {:name "luasnip"}
               {:name "path"}
               {:name "calc"}
               {:name "latex_symbols"}
               {:name "nvim_lsp_signature_help"}
               {:name "treesitter" :keyword_length 2}
               {:name "buffer" :keyword_length 2}
               {:name "dictionary" :keyword_length 3}])
   :mapping 
    {:<C-k> (cmp.mapping.select_prev_item)
     :<C-j> (cmp.mapping.select_next_item)
     :<C-d> (cmp.mapping (cmp.mapping.scroll_docs 1)
                         [ :i :c])
     :<C-u> (cmp.mapping (cmp.mapping.scroll_docs -1)
                         [ :i :c])
     :<CR>  (cmp.mapping.confirm {:select true})}
   :window 
    {:documentation (cmp.config.window.bordered
                     {:winhighlight "FloatBorder:VisualNOS"})}

   :sorting
    {:comparators
      [cmp.config.compare.offset
       cmp.config.compare.exact
       cmp.config.compare.score
       comparator.under
       cmp.config.compare.kind
       cmp.config.compare.sort_text
       cmp.config.compare.length
       cmp.config.compare.order]}

   :formatting
    {:fields [:kind :abbr :menu]
     :format 
      (fn [entry vim-item]
        (set vim_item.kind (. kind-icons vim_item.kind))
        (set vim-item.menu (. kind-menu entry.source.name)) 
        vim-item)}

   :experimental
    {:ghost_text true}})

(dictionary.setup 
  {:dic 
   {:* [(.. (os.getenv :XDG_DATA_HOME) "/words")]}})
