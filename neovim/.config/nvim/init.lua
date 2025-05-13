local plug = vim.fn['plug#']

vim.call('plug#begin')
plug('nvim-treesitter/nvim-treesitter')
plug('sainnhe/gruvbox-material')
plug('folke/which-key.nvim')
vim.call('plug#end')

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_enable_italic = 1
vim.cmd 'colorscheme gruvbox-material'

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.clipboard = 'unnamedplus'
