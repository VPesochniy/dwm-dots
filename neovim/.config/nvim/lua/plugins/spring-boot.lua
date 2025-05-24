-- -- Указываем путь к установленному VSCodium-расширению Spring Boot Tools
-- vim.g.spring_boot = {
--   jdt_extensions_path = "~/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal",
--   -- (необязательно) можно явно задать список jar-файлов расширений:
--   jdt_extensions_jars = {
--     "io.projectreactor.reactor-core.jar",
--     "org.reactivestreams.reactive-streams.jar",
--     "jdt-ls-commons.jar",
--     "jdt-ls-extension.jar",
--   },
-- }
-- Настраиваем сам плагин Spring Boot
require("spring_boot").setup({
  ls_path = "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/language-server/spring-boot-language-server-1.62.0-SNAPSHOT-exec.jar",
  jdt_extensions_path = "/home/vpesochniy/.vscode-oss/extensions/vmware.vscode-spring-boot-1.62.0-universal/jars",
})
