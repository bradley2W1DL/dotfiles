local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local mason_lspconfig = require("user.lsp.mason-lspconfig")

local handlers = require("user.lsp.handlers")

handlers.setup_diagnostics()

local servers = mason_lspconfig.get_installed_servers()
-- Loop over all mason-lspconfig installed servers
for _, server in ipairs(servers) do
  -- print(server) -- output each server name

  local server_settings = {
    on_attach = handlers.on_attach
  }

  -- Add server specific setup attributes like so:
  if 'sumneko_lua' then
    server_settings.settings = {
      Lua = { diagnostics = { globals = { "vim" } } }
    }
  end

  lspconfig[server].setup(server_settings)
end

