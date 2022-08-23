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
  ensure_installed = { "sumneko_lua", "solargraph" }
}


-- FORGET ALL THIS FOR NOW...MIGHT NOT NEED AT ALL...
-- local handlers = require("handlers")

-- Register a handler that will be called for all installed servers.
-- Alternatively, you may also register handlers on specific servers
-- I think the syntax is wrong here...(for mason over lsp_installer or w/e
-- mason_installer.on_server_ready(function(server)
--   local opts = {
--     on_attach = require("user.lsp.handlers").on_attach,
--     capabilities = require("user.lsp.handlers").capabilities,
--   }
--   
--   if server.name == "jsonls" then
--     local jsonls_opts = require("user.lsp.settings.jsonls")
--     opts = vim.tbl_deep_extend("force", jsonls_opts, opts)
--   end
-- 
--   if server.name == "sumneko_lua" then
--     local sumneko_opts = require("user.lsp.settings.sumneko_lua")
--     opts = vim.tbl_deep_extend("force", sumneko_opts, opts)
--   end
-- 
--   -- this setup() function is exactly the same as lspconfig's setup
--   -- refer to https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
--   server:setup(opts)
-- end)
