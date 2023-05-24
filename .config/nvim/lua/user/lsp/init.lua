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
    flags = handlers.lsp_flags,
  }

  if server == "lua_ls" then
    server_settings.settings = {
      Lua = { diagnostics = { globals = { "vim" } } }
    }
  end

  if server == "solargraph" then
    server_settings.settings = {
      solargraph = {
        diagnostics = true,
        formatting = false,
        autoFormat = false,
        useBundler = true,
      }
    }
  end

  if server == "diagnosticls" then
    -- syntax here maybe should be server_settings.init_options as to not overwrite default server_settings 🤷
    server_settings.init_options = {
      linters = { rubocop = require("user.lsp.settings.rubocop") },
      filetypes = { ruby = "rubocop" }
    }
  end

  if server == 'emmet_ls' then
    server_settings.capabilities.textDocument.completion.completionItem.snippetSupport = true
    server_settings.filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'scss', 'sass', 'less' }
    server_settings.init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true,
        }
      }
    }
  end

  lspconfig[server].setup(server_settings)
end

