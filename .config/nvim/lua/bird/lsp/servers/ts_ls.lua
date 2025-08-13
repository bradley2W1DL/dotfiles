local lspconfig = require("lspconfig")

return {
  mason_managed = true,
  root_dir = lspconfig.util.root_pattern({ "package.json", "tsconfig.json" }),
  single_file_support = false
}