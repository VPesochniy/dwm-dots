local M = {}

local home = os.getenv("HOME")
local spring_tools_path = vim.fn.glob(home .. "/.vscode-oss/extensions/vmware.vscode-spring-boot-*-universal/")

require("spring_boot").setup({
    ls_path = vim.fn.glob(spring_tools_path .. "language-server/spring-boot-language-server-*-SNAPSHOT-exec.jar"),
})

M.jars = vim.split(vim.fn.glob(spring_tools_path .. "jars/*.jar", 1), "\n")

return M
