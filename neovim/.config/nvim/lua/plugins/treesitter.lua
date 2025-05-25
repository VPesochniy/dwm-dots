require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "vim", "vimdoc", "lua", "bash", "markdown", "c", "java", "xml", "json", "dockerfile", "sql", "properties" },
    highlight = {
        enable = true,
        additional_vim_regex_highlighting = false,
    },
    incremental_selection = {
        enable = true,
        keymaps = {
            node_incremental = "V",
            node_decremental = "v",
        },
    },
}
