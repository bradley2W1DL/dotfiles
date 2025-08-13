local lspconfig = require("lspconfig")

return {
  mason_managed = true,
  root_dir = lspconfig.util.root_pattern({ "deno.json", "deno.jsonc" }),
  single_file_support = false
}