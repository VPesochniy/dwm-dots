local home = os.getenv("HOME")
local mason_packages = home .. "/.local/share/nvim/mason/packages/"
local lombok = mason_packages .. "jdtls/lombok.jar"
local project_cache = home .. "/.jdtls/" .. vim.fn.fnamemodify(vim.fn.getcwd(), ":p:h:t")

local config = {
    cmd = {
        "java",
        "-Declipse.application=org.eclipse.jdt.ls.core.id1",
        "-Dosgi.bundles.defaultStartLevel=4",
        "-Declipse.product=org.eclipse.jdt.ls.core.product",
        "-Dlog.protocol=true",
        "-Dlog.level=ALL",
        "-javaagent:" .. lombok,
        "-Xms512m",
        "-Xmx1024m",
        "--add-modules=ALL-SYSTEM",
        "--add-opens", "java.base/java.util=ALL-UNNAMED",
        "--add-opens", "java.base/java.lang=ALL-UNNAMED",
        "-jar", vim.fn.glob(mason_packages .. "jdtls/plugins/org.eclipse.equinox.launcher_*.jar"),
        "-configuration", mason_packages .. "jdtls/config_linux",
        "-data", project_cache,
    },

    root_dir = vim.fs.dirname(vim.fs.find({ "gradlew", ".git", "mvnw" }, { upward = true })[1]),

    init_options = {
        bundles = {
            vim.fn.glob(
                mason_packages .. "java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar", 1)
        },
    },
}

local test_bundles = vim.split(vim.fn.glob(mason_packages .. "java-test/extension/server/*.jar", 1), "\n")
vim.list_extend(config.init_options.bundles, test_bundles)


vim.list_extend(config.init_options.bundles, require("plugins.spring-boot").jars)

require("jdtls").start_or_attach(config)
