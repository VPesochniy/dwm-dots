require 'nvim-treesitter.configs'.setup {
    ensure_installed = { "vim", "vimdoc", "lua", "bash", "markdown", "c", "cpp", "java", "xml", "json", "dockerfile", "sql", "properties" , "yaml"},
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
