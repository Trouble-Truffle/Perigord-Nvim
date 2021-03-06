(module Lang.LSP
  {autoload {lspconfig lspconfig}
   autoload {a aniseed.core}
   autoload {idris idris2}
   autoload {navic nvim-navic}
   autoload {cmp-lsp cmp_nvim_lsp}})

(def- capabilities (cmp-lsp.update_capabilities (vim.lsp.protocol.make_client_capabilities)))
(def- servers [ "bashls" "clangd" "cmake" "html" "idris2_lsp" "pyright" "rls" "sumneko_lua" "tsserver" "rnix"])

(each [_ server (ipairs servers)]
  ((. (. lspconfig server) :setup)
   {:capabilities capabilities
    :on_attach (fn [client bufnr]
                 (navic.attach client bufnr))}))


(lspconfig.hls.setup
  {:capabilities capabilities
   :on_attach (fn [client bufnr]
                 (navic.attach client bufnr))
   :settings {:haskell 
              {:formattingProvider "brittany"
               :hlintOn true
               :renameOn true
               :plugin
                  {:hlint {:globalOn true}}
                  {:eval {:globalOn true
                          :config 
                            {:exception true}}}
                  {:tactics {:globalOn true}}
                  {:gadt {:globalOn true}}
                  {:splice {:globalOn true}}
                  {:rename {:globalOn true}}
                  {:haddockComments {:globalOn true}}}}})
                       


(vim.diagnostic.config 
  {:virtual_text false
   :signs true
   :float 
    {:focusable false
     :style :minimal
     :border :rounded
     :source :always}})
      
(def- signs
  {:DiagnosticSignError ""
   :DiagnosticSignWarn  ""
   :DiagnosticSignHint  ""
   :DiagnosticSignInfo  ""})

(each [diag-type icon (pairs signs)]
    (vim.fn.sign_define diag-type 
                        {:text icon 
                         :texthl diag-type 
                         :numhl diag-type}))

(tset vim.lsp.handlers "textDocument/hover"
      (vim.lsp.with vim.lsp.handlers.hover {:border :rounded}))  

(tset vim.lsp.handlers "textDocument/signatureHelp" 
     (vim.lsp.with vim.lsp.handlers.signature_help {:border :rounded}))

