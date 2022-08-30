local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

require("user.lsp.mason-lspconfig")

local handlers = require("user.lsp.handlers")
-- handlers.setup()

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
--   (defined in handlers.lua on_attach function)
--   todo, preferablly this would be configured with mason-lspconfig
local servers = { "solargraph" }

-- mason-lspconfig.get_installed_servers()

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = handlers.on_attach,
    flags = handlers.lsp_flags,
  }
end
