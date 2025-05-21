require'nvim-treesitter.configs'.setup {
	ensure_installed = { "vimdoc", "lua", "bash", "markdown", "c", "java"},
	incremental_selection = {
		enable = true,
		keymaps = {
			node_incremental = "V",
			node_decremental = "v",
		},
	},
	indent = {
		enable = true,
	},
}
