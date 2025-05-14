vim.g.mapleader = ' '

local map = vim.api.nvim_set_keymap
local opts = { noremap = true, silent = true }

map('n', '<C-j>', '}', opts)
map('n', '<C-k>', '{', opts)

map('n', '<A-e>', '<Cmd>NvimTreeToggle<CR>', opts)

map('n', '<A-j>', '<Cmd>BufferPrevious<CR>', opts)
map('n', '<A-k>', '<Cmd>BufferNext<CR>', opts)

map('n', '<A-1>', '<Cmd>BufferGoto 1<CR>', opts)
map('n', '<A-2>', '<Cmd>BufferGoto 2<CR>', opts)
map('n', '<A-3>', '<Cmd>BufferGoto 3<CR>', opts)
map('n', '<A-4>', '<Cmd>BufferGoto 4<CR>', opts)
map('n', '<A-5>', '<Cmd>BufferGoto 5<CR>', opts)
map('n', '<A-6>', '<Cmd>BufferGoto 6<CR>', opts)
map('n', '<A-7>', '<Cmd>BufferGoto 7<CR>', opts)
map('n', '<A-8>', '<Cmd>BufferGoto 8<CR>', opts)
map('n', '<A-9>', '<Cmd>BufferGoto 9<CR>', opts)
map('n', '<A-0>', '<Cmd>BufferLast<CR>', opts)

map('n', '<A-w>', '<Cmd>BufferClose<CR>', opts)
map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

map('n', '<A-f>', '<Cmd>Telescope find_files<CR>', opts)
-- map('n', '<leader>ff', '<Cmd>Telescope find_files<CR>', opts)
-- map('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>', opts)
-- map('n', '<leader>fb', '<Cmd>Telescope buffers<CR>', opts)
-- map('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>', opts)