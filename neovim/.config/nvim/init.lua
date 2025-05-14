local Plug = vim.fn['plug#']

vim.call('plug#begin')
Plug('nvim-treesitter/nvim-treesitter')
Plug('sainnhe/gruvbox-material')
Plug('folke/which-key.nvim')
Plug('nvim-lualine/lualine.nvim')
Plug('nvim-tree/nvim-web-devicons')
Plug('romgrk/barbar.nvim')
Plug('goolord/alpha-nvim')
Plug('nvim-tree/nvim-tree.lua')
Plug('lewis6991/gitsigns.nvim')
Plug('windwp/nvim-autopairs')
Plug('numToStr/Comment.nvim')
Plug('norcalli/nvim-colorizer.lua')
Plug('nvim-lua/plenary.nvim')
Plug('nvim-telescope/telescope.nvim')
vim.call('plug#end')

vim.g.gruvbox_material_background = 'hard'
vim.g.gruvbox_material_palette = 'original'
vim.g.gruvbox_material_enable_italic = 1
vim.cmd 'colorscheme gruvbox-material'

vim.wo.relativenumber = true
vim.wo.number = true

vim.opt.clipboard = 'unnamedplus'
vim.o.ignorecase = true
vim.o.smartcase = true

require('lualine').setup {
    options = { theme  = 'gruvbox_dark' },
}

require'alpha'.setup(require'alpha.themes.dashboard'.config)

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.shiftwidth = 4

require("nvim-tree").setup()
require("nvim-autopairs").setup {}
require("Comment").setup()
require'colorizer'.setup()
require("config.keybinds")