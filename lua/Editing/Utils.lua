--[[
    # Editing.Utils
        -   Controls various options that controls the effects of inputs behind the scenes
--]]

--[ Indentation ]
vim.o.tabstop = 4 -- Number of spaces a tab is
vim.o.expandtab = true -- Make tabs spaces
vim.o.softtabstop = 2 -- Allows for tab size lower
--^ than 'tabstop' via mixing
--^ spaces and tabs
vim.o.smartindent = true -- A bit complex for a tl;dr
vim.o.shiftwidth = 2 -- Number of spaces used by indents

vim.o.autoindent = true -- Indent new lines
vim.o.smarttab = true -- Insert blanks based on 'shiftwidth'

--[ Searching ]
vim.o.incsearch = true -- Update highlighting while typing
vim.o.ignorecase = true -- Ignore case
vim.o.smartcase = true -- Overrides ignore case if search pattern
--^ contains Uppercase characters
vim.o.wrapscan = false -- Disable wrapping in searches
--^ mostly to allow recursive macros
vim.o.hlsearch = true -- Highlight search after confirming

--[ Windowing ]
vim.o.splitbelow = true -- split downwards
vim.o.splitright = true -- split rightwards

--[ Misc ]

vim.wo.foldmethod = "expr"
vim.o.foldlevel = 99
vim.o.foldexpr =  "nvim_treesitter#foldexpr()"
vim.o.foldtext      = [[substitute(getline(v:foldstart),'\\\\t',repeat('\\ ',&tabstop),'g').'...'.trim(getline(v:foldend)) . ' (' . (v:foldend - v:foldstart + 1) . ' lines)']]

vim.o.undofile = true -- Enable undo file on exit
vim.o.undodir = "/tmp/nvim-undos" -- location of undo file
vim.o.timeoutlen = 300  -- Time for a mappes sequence to finish
vim.o.mouse = "a" -- Enable mouse usage in nvim
vim.o.iskeyword = vim.o.iskeyword .. ",-" -- add characters that would divide a word
vim.g.apl_prefix_key = "."
