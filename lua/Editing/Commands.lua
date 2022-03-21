--[[
    # Editing.Commands
        -   Controls the commands and autocommands
--]]

vim.cmd [[command! Repl execute "lua require('Lang.Repl').repl(vim.bo.filetype)"]]
vim.cmd [[command! CommentBox execute "lua require('nvim-comment-frame').add_comment()"]]
vim.cmd [[command! COMMENTBOX execute "lua require('nvim-comment-frame').add_multiline_comment()"]]
vim.cmd [[command! Format  execute "lua vim.lsp.buf.formatting_sync()"]]
vim.cmd [[command! Run execute "!./%"]]
vim.cmd [[
	augroup _general_settings
         autocmd BufDelete alpha :set cursorline
	    autocmd FileType qf,help,man,packer,lspinfo nnoremap <silent> <buffer> q :close<CR> 
	    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200})
	augroup end
]]
-- enable direct exit on q on some buffers
-- temporarily highlight text on copy

vim.cmd[[
   augroup _run
      autocmd FileType cabal :command! Run execute ":!cabal run"
      autocmd FileType haskell :command! Run execute ":!echo 'main' | cabal repl"
      autocmd FileType cpp :command! Run execute ":make"
   augroup end
]]

vim.cmd[[
   augroup _apl
      autocmd FileType apl :set timeoutlen=1000
   augroup end
]]
--
vim.cmd [[
   augroup _org_mode
      autocmd FileType org :set wrap linebreak
   augroup end
]]
vim.cmd [[
function! AnimatedTerm() abort
   ToggleTerm direction=horizontal size=1
  call animate#window_percent_height(0.25)
endfunction
]]
