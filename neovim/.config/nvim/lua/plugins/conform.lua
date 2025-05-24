local home = os.getenv("HOME")
local mason_path = home .. "/.local/share/nvim/mason/packages"
local google_java_format_path = mason_path .. "/google-java-format/google-java-format-1.27.0-all-deps.jar"
require("conform").setup({
    formatters_by_ft = {
        java = { "google_java_format" },
    },
    formatters = {
        google_java_format = {
            command = "java",
            args = {
                "-jar",
                google_java_format_path,
                "--aosp",
                "-",
            },
        },
    },
    format_on_save = {
        timeout_ms = 1000,
        lsp_fallback = false,
    },
})
