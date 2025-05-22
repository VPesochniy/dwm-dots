require("neo-tree").setup({
    window = {
        position = 'right',
        width = 0.3,
    },
    filesystem = {
        filtered_items = {
            hide_dotfiles = false,
            hide_gitignored = false,
        },
        follow_current_file = {
            enabled = true,
        },
    },
})
vim.api.nvim_set_hl(0, 'NeoTreeNormal', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'NeoTreeNormalNC', { link = 'Normal' })
vim.api.nvim_set_hl(0, 'NeoTreeEndOfBuffer', { link = 'EndOfBuffer' })
