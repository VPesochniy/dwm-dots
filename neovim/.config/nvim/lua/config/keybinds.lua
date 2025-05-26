vim.g.mapleader = ' '

local keymap = vim.keymap.set

-- Center screen while moving
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-d>', '<C-d>zz')
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "G", "Gzz")

-- turn off highlighting for the previous search
keymap('n', '<Esc>', '<CMD>nohlsearch<CR>')
keymap('n', '<C-c>', '<CMD>nohlsearch<CR>')

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

-- Move window to another tab
keymap('n', '<C-t>', '<C-w>T')

-- Double 'Esc' for exit terminal mode
keymap('t', '<Esc><Esc>', '<C-\\><C-n>')

-- 'Ctrl + C' for exit insert mode
keymap('i', '<C-c>', '<Esc>')

keymap('n', '<leader>e', '<CMD>Neotree toggle<CR>')

keymap('n', '<leader>ff', '<CMD>Telescope find_files<CR>')
keymap('n', '<leader>fg', '<CMD>Telescope live_grep<CR>')
keymap('n', '<leader>fh', '<CMD>Telescope help_tags<CR>')
keymap('n', '<leader>fd', '<CMD>Telescope diagnostics<CR>', { desc = '[F]ind [D]iagnostics' })

-- This is where you enable features that only work
-- if there is a language server active in the file
vim.api.nvim_create_autocmd('LspAttach', {
    desc = 'LSP actions',
    callback = function(event)
        local opts = { buffer = event.buf }

        keymap('n', 'K', '<CMD>lua vim.lsp.buf.hover()<CR>', opts)
        keymap('n', 'gd', '<CMD>lua vim.lsp.buf.definition()<CR>', opts)
        keymap('n', 'gD', '<CMD>lua vim.lsp.buf.declaration()<CR>', opts)
        keymap('n', 'gi', '<CMD>lua vim.lsp.buf.implementation()<CR>', opts)
        keymap('n', 'go', '<CMD>lua vim.lsp.buf.type_definition()<CR>', opts)
        keymap('n', 'gr', '<CMD>lua vim.lsp.buf.references()<CR>', opts)
        keymap('n', 'gs', '<CMD>lua vim.lsp.buf.signature_help()<CR>', opts)
        keymap('n', '<leader>r', '<CMD>lua vim.lsp.buf.rename()<CR>', opts)
        keymap({ 'n', 'x' }, '<leader>l', '<CMD>lua vim.lsp.buf.format({async = true})<CR>', opts)
        keymap('n', '<leader>a', '<CMD>lua vim.lsp.buf.code_action()<CR>', opts)
    end,
})

-- Add a mark
keymap("n", "M", "<CMD>lua require('harpoon.mark').add_file()<CR>")

keymap("n", "<C-i>", "<C-i>")

-- Toggle Harpoon UI
keymap("n", "<Tab>", "<CMD>lua require('harpoon.ui').toggle_quick_menu()<CR>")
keymap("n", "<C-n>", "<CMD>lua require('harpoon.ui').nav_next()<CR>")
keymap("n", "<C-p>", "<CMD>lua require('harpoon.ui').nav_prev()<CR>")

keymap("n", "<leader>u", vim.cmd.UndotreeToggle)
keymap("n", "<leader>tt", vim.cmd.ToggleTerm)
keymap("n", "<leader>tn", vim.cmd.TermNew)

keymap('n', '<leader>co', "<CMD>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
keymap('n', '<leader>crv', "<CMD>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
keymap('v', '<leader>crv', "<Esc><CMD>lua require('jdtls').extract_variable(true)<CR>", { desc = 'Extract Variable' })
keymap('n', '<leader>crc', "<CMD>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
keymap('v', '<leader>crc', "<Esc><CMD>lua require('jdtls').extract_constant(true)<CR>", { desc = 'Extract Constant' })
keymap('v', '<leader>crm', "<Esc><CMD>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })
keymap("n", "<leader>jtc", "<CMD>lua require'jdtls'.test_class()<CR>")
keymap("n", "<leader>jtm", "<CMD>lua require'jdtls'.test_nearest_method()<CR>")
keymap('n', '<leader>jdr', "<CMD>lua require'springboot-nvim'.boot_run()<CR>", { desc = "Spring Boot Run Project" })
keymap('n', '<leader>jcc', "<CMD>lua require'springboot-nvim'.generate_class()<CR>", { desc = "Java Create Class" })
keymap('n', '<leader>jci', "<CMD>lua require'springboot-nvim'.generate_interface()<CR>",
    { desc = "Java Create Interface" })
keymap('n', '<leader>jce', "<CMD>lua require'springboot-nvim'.generate_enum()<CR>", { desc = "Java Create Enum" })
keymap('n', '<leader>jdc', "<CMD>lua require'dap'.continue()<CR>")
keymap('n', '<leader>jdb', "<CMD>lua require'dap'.toggle_breakpoint()<CR>")

-- Easily split windows
keymap("n", "<leader>v", ":vsplit<CR>", { desc = "[W]indow Split [V]ertical" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "Indent left in visual mode" })
keymap("v", ">", ">gv", { desc = "Indent right in visual mode" })
keymap('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })

keymap("v", "J", ":m '>+1<CR>gv=gv", { silent = true })
keymap("v", "K", ":m '<-2<CR>gv=gv", { silent = true })
keymap("n", "=ap", "ma=ap'a")

local Terminal   = require('toggleterm.terminal').Terminal

local lazygit    = Terminal:new({
    cmd = "lazygit",
    hidden = true,
    direction = "float",
    on_open = function()
        vim.cmd("startinsert!")
    end,
})

local float_term = Terminal:new({
    hidden = true,
    direction = "float",
    on_open = function()
        vim.cmd("startinsert!")
    end,
})

function _float_term_toggle()
    float_term:toggle()
end

function _lazygit_toggle()
    lazygit:toggle()
end

keymap("n", "<leader>g", "<CMD>lua _lazygit_toggle()<CR>", { noremap = true })
keymap("n", "<leader>tf", "<CMD>lua _float_term_toggle()<CR>", { noremap = true })

keymap("n", "<C-S-h>", "<CMD>vertical resize +2<CR>", { silent = true })
keymap("n", "<C-S-j>", "<CMD>resize +2<CR>", { silent = true })
keymap("n", "<C-S-k>", "<CMD>resize -2<CR>", { silent = true })
keymap("n", "<C-S-l>", "<CMD>vertical resize -2<CR>", { silent = true })

keymap("i", "<C-l>", "<Del>")
keymap("n", "U", "<C-r>")
keymap("n", "?", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
keymap("n", "<leader>x", "<CMD>!chmod +x %<CR>")
