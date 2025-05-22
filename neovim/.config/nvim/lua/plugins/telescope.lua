require('telescope').setup{
  defaults = {
    mappings = {
      i = {
        ["<C-k>"] = "preview_scrolling_up",
        ["<C-j>"] = "preview_scrolling_down",
        ["<C-h>"] = "preview_scrolling_left",
        ["<C-l>"] = "preview_scrolling_right",
      }
    }
  },
  pickers = {
    find_files = {
      -- theme = "dropdown",
    }
  },
  extensions = {
  }
}
