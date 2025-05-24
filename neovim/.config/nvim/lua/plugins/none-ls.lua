require("null-ls").setup({
  sources = {
    require("null-ls").builtins.formatting.google_java_format.with({
      extra_args = { "--aosp" }, -- or your desired style
    }),
  },
})
