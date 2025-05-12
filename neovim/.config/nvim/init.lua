local plug = vim.fn['plug#']

vim.call('plug#begin')
plug('nvim-treesitter/nvim-treesitter')
plug('sainnhe/gruvbox-material')
vim.call('plug#end')

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_enable_italic = 1
vim.cmd 'colorscheme gruvbox-material'

vim.opt.clipboard = 'unnamedplus'
