vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.clipboard = 'unnamedplus'
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.termguicolors = true
vim.opt.cursorline = true
vim.opt.showmode = false
vim.opt.scrolloff = 10
vim.opt.sidescrolloff = 20
vim.opt.wrap = false
vim.opt.expandtab = true
vim.opt.shiftwidth = 4
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.numberwidth = 4
vim.opt.smartindent = true
vim.opt.breakindent = true
vim.opt.signcolumn = 'yes'

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1
vim.opt.backup = false
vim.opt.conceallevel = 0
vim.opt.fileencoding = "utf-8"
vim.opt.mouse = "a"
vim.opt.splitbelow = true
vim.opt.splitright = true
vim.opt.timeoutlen = 300
vim.opt.undofile = true
vim.opt.updatetime = 100
vim.opt.writebackup = false

vim.opt.hlsearch = true
vim.opt.incsearch = true

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight when yanking (copying) text',
  group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
  callback = function()
    vim.hl.on_yank()
  end,
})
