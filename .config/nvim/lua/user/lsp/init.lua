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
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
  }

  if server == "sumneko_lua" then
    server_settings.settings = {
      Lua = { diagnostics = { globals = { "vim" } } }
    }
  end

  if server == "solargraph" then
    server_settings.settings = {
      solargraph = {
        diagnostics = true,
        formatting = true,
        useBundler = false,
      }
    }
  end

  -- TODO, can't seem to get diagnostics to work for ruby files...
  if server == "diagnosticls" then
    -- local rubocopConfig = require("diagnosticls-configs.linters.rubocop")
    -- can variables be overwritten in Lua?
    server_settings = {
      init_options = {
        linters = { rubocop = require("user.lsp.settings.rubocop") },
        filetypes = { ruby = "rubocop" }
      }
    }
  end

  lspconfig[server].setup(server_settings)
end

