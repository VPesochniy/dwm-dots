vim.g.mapleader = ' '

local keymap = vim.keymap.set

-- Center screen while moving
keymap('n', '<C-u>', '<C-u>zz')
keymap('n', '<C-d>', '<C-d>zz')
keymap("n", "n", "nzzzv")
keymap("n", "N", "Nzzzv")
keymap("n", "G", "Gzz")

-- turn off highlighting for the previous search
keymap('n', '<Esc>', '<Cmd>nohlsearch<Cr>')
keymap('n', '<C-c>', '<Cmd>nohlsearch<Cr>')

-- disable copying to the clipboard
keymap({ 'n', 'v' }, 'd', '"_d')
keymap({ 'n', 'v' }, 'D', '"_D')
keymap({ 'n', 'v' }, 'c', '"_c')
keymap({ 'n', 'v' }, 'C', '"_C')
keymap({ 'n', 'v' }, 's', '"_s')
keymap({ 'n', 'v' }, 'S', '"_S')

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

keymap('n', '<leader>e', '<Cmd>Neotree toggle<CR>')

keymap('n', '<leader>ff', function()
    require('telescope.builtin').find_files({
        hidden = true,
        no_ignore = true,
        find_command = {
            'fd', '--type', 'f', '--hidden', '--no-ignore', '.',
            vim.fn.getcwd(),
            vim.fn.expand("~/.config/nvim"),
        },

    })
end)


vim.keymap.set('n', '<leader>fg', function()
    require('telescope.builtin').live_grep({
        additional_args = { "--hidden", "--no-ignore" },
        search_dirs = {
            vim.fn.getcwd(),
            vim.fn.expand("~/.config/nvim"),
        },
    })
end, { desc = 'Live Grep (hidden and no-ignore)' })

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
keymap("n", "<leader>tn", vim.cmd.TermNew)

keymap('n', '<leader>co', "<Cmd>lua require'jdtls'.organize_imports()<CR>", { desc = 'Organize Imports' })
keymap('n', '<leader>crv', "<Cmd>lua require('jdtls').extract_variable()<CR>", { desc = 'Extract Variable' })
keymap('v', '<leader>crv', "<Esc><Cmd>lua require('jdtls').extract_variable(true)<CR>", { desc = 'Extract Variable' })
keymap('n', '<leader>crc', "<Cmd>lua require('jdtls').extract_constant()<CR>", { desc = 'Extract Constant' })
keymap('v', '<leader>crc', "<Esc><Cmd>lua require('jdtls').extract_constant(true)<CR>", { desc = 'Extract Constant' })
keymap('v', '<leader>crm', "<Esc><Cmd>lua require('jdtls').extract_method(true)<CR>", { desc = 'Extract Method' })
keymap("n", "<leader>jtc", "<Cmd>lua require'jdtls'.test_class()<CR>")
keymap("n", "<leader>jtm", "<Cmd>lua require'jdtls'.test_nearest_method()<CR>")
keymap('n', '<leader>jdr', "<Cmd>lua require'springboot-nvim'.boot_run()<CR>", { desc = "Spring Boot Run Project" })
keymap('n', '<leader>jcc', "<Cmd>lua require'springboot-nvim'.generate_class()<CR>", { desc = "Java Create Class" })
keymap('n', '<leader>jci', "<Cmd>lua require'springboot-nvim'.generate_interface()<CR>",
    { desc = "Java Create Interface" })
keymap('n', '<leader>jce', "<Cmd>lua require'springboot-nvim'.generate_enum()<CR>", { desc = "Java Create Enum" })
keymap('n', '<leader>jdc', "<Cmd>lua require'dap'.continue()<CR>")
keymap('n', '<leader>jdb', "<Cmd>lua require'dap'.toggle_breakpoint()<CR>")

-- Easily split windows
keymap("n", "<leader>v", ":vsplit<cr>", { desc = "[W]indow Split [V]ertical" })

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

keymap("n", "<leader>g", "<cmd>lua _lazygit_toggle()<CR>", { noremap = true })
keymap("n", "<leader>tf", "<cmd>lua _float_term_toggle()<CR>", { noremap = true })

keymap("n", "<C-S-h>", "<Cmd>vertical resize +2<CR>", { silent = true })
keymap("n", "<C-S-j>", "<Cmd>resize +2<CR>", { silent = true })
keymap("n", "<C-S-k>", "<Cmd>resize -2<CR>", { silent = true })
keymap("n", "<C-S-l>", "<Cmd>vertical resize -2<CR>", { silent = true })

keymap("i", "<C-l>", "<Del>")
