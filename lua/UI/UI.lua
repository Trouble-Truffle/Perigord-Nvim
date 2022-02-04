--[[
    # UI.UI
        - Controls the visuals of nvim
--]]

--[ Bars ]
vim.o.showtabline = 1 -- Show tabs only when its more than one

vim.o.number = true -- Show cursor location
vim.o.relativenumber = true -- show numbers relative to cursor
vim.o.numberwidth = 2 -- Width of the number bar

--[ Theme ]--
--vim.cmd[[ "highlight CursorLine gui=underline" ]]
-- vim.cmd("highlight CursorLineNr term=bold cterm=none ctermbg=none ctermfg=yellow gui=bold")
vim.o.title = true -- set windowname as title name
vim.o.termguicolors = true -- Enable terminal colors

vim.g.dracula_show_end_of_buffer = false
vim.g.dracula_transparent_bg = false
vim.g.transparent_enabled = true
vim.g.dracula_italic_comment = true
vim.g.dracula_colors = {
   bg = "#030306",
   menu = "#080a0c",
   visual = "#3E4975",
}

vim.cmd [[
   try
     colorscheme dracula
   catch /^Vim\%((\a\+)\)\=:E185/
     colorscheme default
     set background=dark
   endtry
   ]]

--[ Body ]--
vim.opt.scrolloff = 4 -- Lines before scrolling the screen
vim.opt.sidescrolloff = 12 -- Same as above but sideways
vim.cmd [[hi CursorLine term=underline cterm=underline guibg=none gui=underline]]
vim.o.cursorline = false -- enable cursorline
vim.opt.wrap = false -- Dont wrap long text

vim.cmd [[set guifont=JetBrainsMono\ Nerd\ Font:h11]]
vim.g.neovide_cursor_vfx_mode = "railgun"
vim.g.neovide_transparency = 0.2
