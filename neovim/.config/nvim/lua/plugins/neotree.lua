require("neo-tree").setup({
	window = {
		position = "right",
	},
	filesystem = {
		filtered_items = {
			hide_dotfiles = false,
			hide_gitignored = false,
		},
	},
})
