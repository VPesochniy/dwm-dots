vim.g.mapleader = ' '

local keymap = vim.keymap.set

-- Center screen while moving
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-d>', '<C-d>zz')
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")

-- turn off highlighting for the previous search
keymap('n', '<Esc>', '<Cmd>nohlsearch<Cr>')
keymap('n', '<C-c>', '<Cmd>nohlsearch<Cr>')

-- disable copying to the clipboard
keymap({ 'n', 'v' }, 'd', '"_d')
keymap({ 'n', 'v' }, 'D', '"_D')
keymap({ 'n', 'v' }, 'c', '"_c')
keymap({ 'n', 'v' }, 'C', '"_C')

-- move focus to the window
keymap('n', '<C-h>', '<C-w><C-h>')
keymap('n', '<C-l>', '<C-w><C-l>')
keymap('n', '<C-j>', '<C-w><C-j>')
keymap('n', '<C-k>', '<C-w><C-k>')

-- Close window
keymap('n', '<C-q>', '<C-w>q')

-- Double 'Esc' for exit terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>')

-- 'Ctrl + C' for exit insert mode
keymap('i', '<C-c>', '<Esc>')

keymap('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

keymap('n', '<leader>ff', '<Cmd>Telescope find_files<CR>')
keymap('n', '<leader>fg', '<Cmd>Telescope live_grep<CR>')
keymap('n', '<leader>fh', '<Cmd>Telescope help_tags<CR>')
keymap('n', '<leader>fd', '<Cmd>Telescope diagnostics<CR>', { desc = '[F]ind [D]iagnostics' })

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        keymap('n', 'K', '<cmd>lua vim.lsp.buf.hover()<cr>', opts)
        keymap('n', 'gd', '<cmd>lua vim.lsp.buf.definition()<cr>', opts)
        keymap('n', 'gD', '<cmd>lua vim.lsp.buf.declaration()<cr>', opts)
        keymap('n', 'gi', '<cmd>lua vim.lsp.buf.implementation()<cr>', opts)
        keymap('n', 'go', '<cmd>lua vim.lsp.buf.type_definition()<cr>', opts)
        keymap('n', 'gr', '<cmd>lua vim.lsp.buf.references()<cr>', opts)
        keymap('n', 'gs', '<cmd>lua vim.lsp.buf.signature_help()<cr>', opts)
        keymap('n', '<leader>r', '<cmd>lua vim.lsp.buf.rename()<cr>', opts)
        keymap({ 'n', 'x' }, '<leader>l', '<cmd>lua vim.lsp.buf.format({async = true})<cr>', opts)
        keymap('n', '<leader>a', '<cmd>lua vim.lsp.buf.code_action()<cr>', opts)
    end,
})

-- Add a mark
keymap("n", "<leader>m", "<cmd>lua require('harpoon.mark').add_file()<CR>")

keymap("n", "<C-i>", "<C-i>")

-- Toggle Harpoon UI
keymap("n", "<Tab>", "<cmd>lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap("n", "<C-n>", "<cmd>lua require('harpoon.ui').nav_next()<CR>")
keymap("n", "<C-p>", "<cmd>lua require('harpoon.ui').nav_prev()<CR>")

keymap("n", "<leader>u", vim.cmd.UndotreeToggle)
keymap("n", "<leader>tt", vim.cmd.ToggleTerm)

keymap('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
keymap('n', '<leader>crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
keymap('v', '<leader>crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = 'Extract Variable' })
keymap('n', '<leader>crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
keymap('v', '<leader>crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = 'Extract Constant' })
keymap('v', '<leader>crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })

-- Easily split windows
vim.keymap.set("n", "<leader>v", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left in visual mode" })
keymap("v", ">", ">gv", { desc = "Indent right in visual mode" })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap("v", "J", ":m '>+1<CR>gv=gv")
keymap("v", "K", ":m '<-2<CR>gv=gv")
keymap("n", "=ap", "ma=ap'a")
