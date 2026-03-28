vim.opt.expandtab = true -- Convert tabs to spaces
vim.opt.shiftwidth = 4 -- Amount to indent with << and >>
vim.opt.tabstop = 4 -- How many spaces are shown per Tab
vim.opt.softtabstop = 4 -- How many spaces are applied when pressing Tab

vim.opt.smarttab = true
vim.opt.smartindent = true
vim.opt.autoindent = true -- Keep identation from previous line


-- relative line numbers always show
vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.showmode = false
vim.schedule(function() vim.o.clipboard = 'unnamedplus' end)
vim.o.undofile = true
vim.o.cursorline = true

vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function() vim.hl.on_yank() end,
})

-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true


-- Keep signcolumn on by default
-- there is warning / error etc on side
vim.o.signcolumn = 'yes'

vim.opt.scrolloff = 10

-- Sets how neovim will display certain whitespace characters in the editor.
--  See `:help 'list'`
--  and `:help 'listchars'`
vim.opt.list = true
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" }

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- or "■", "▎", etc.
    spacing = 2,
  },
  signs = true,        -- gutter icons
  underline = true,    -- underline problematic code
  update_in_insert = false,
})
