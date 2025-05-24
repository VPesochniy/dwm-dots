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

local spring_boot_jars = {
  "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars/jdt-ls-extension.jar",
  "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars/jdt-ls-commons.jar",
  "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars/commons-lsp-extensions.jar",
  "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars/io.projectreactor.reactor-core.jar",
  "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars/org.reactivestreams.reactive-streams.jar",
  "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars/sts-gradle-tooling.jar",
  "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars/xml-ls-extension.jar",
}

vim.list_extend(config.init_options.bundles, spring_boot_jars)

print("Spring Boot extensions:")
print(vim.inspect(require("spring_boot").java_extensions()))

print("Final bundle list:")
print(vim.inspect(config.init_options.bundles))

require("jdtls").start_or_attach(config)
