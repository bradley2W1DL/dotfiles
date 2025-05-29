-- initialize mason / mason-lspconfig
local mason_status_ok, mason = pcall(require, "mason")
if not mason_status_ok then
  return
end

local lspconfig_status_ok, mason_lspconfig = pcall(require, "mason-lspconfig")
if not lspconfig_status_ok then
  return
end

mason.setup()

mason_lspconfig.setup {
  ensure_installed = { "lua_ls", "eslint", "ts_ls", "emmet_ls", "ruby_lsp" }
}

return mason_lspconfig

