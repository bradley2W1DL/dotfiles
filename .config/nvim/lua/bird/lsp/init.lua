local status_ok, lspconfig = pcall(require, "lspconfig")
if not status_ok then
  return
end

local mason_lspconfig = require("bird.lsp.mason-lspconfig")

local handlers = require("bird.lsp.handlers")

handlers.setup_diagnostics()

local servers = mason_lspconfig.get_installed_servers()

-- Loop over all mason-lspconfig installed servers
-- If LSP is being started twice, once with defaults and again with configured overrides, exclude
-- that server from the automatic_enable list in mason-lspconfig file.
for _, server in ipairs(servers) do
  local server_settings = {
    on_attach = handlers.on_attach,
    capabilities = handlers.capabilities,
    flags = handlers.lsp_flags,
  }

  if server == "lua_ls" then
    server_settings.settings = {
      Lua = {
        diagnostics = { globals = { 'vim' } },
      }
    }
  end

  if server == "ruby_lsp" then
    server_settings.init_options = {
      formatter = 'standardrb',
      linters = { 'standardrb' },
      addonSettings = {
        ["Ruby LSP Rails"] = {
          enablePendingMigrationsPrompt = false,
        }
      }
    }
  end

  if server == "ts_ls" then
    server_settings.root_dir = lspconfig.util.root_pattern({ "package.json", "tsconfig.json" })
    server_settings.single_file_support = false
  end

  if server == "denols" then
    server_settings.root_dir = lspconfig.util.root_pattern({ "deno.json", "deno.jsonc" })
    server_settings.single_file_support = false
  end

  -- is this needed at all? ruby_lsp should handle all this?
  -- if server == "diagnosticls" then
    -- server_settings.init_options = {
    --   linters = { 'standardrb' },
    --   filetypes = { ruby = 'standardrb' },
    -- }
    -- server_settings.init_options = {
    --   linters = { rubocop = require("bird.lsp.settings.rubocop") },
    --   filetypes = { ruby = "rubocop" }
    -- }
  -- end

  if server == 'emmet_ls' then
    server_settings.capabilities.textDocument.completion.completionItem.snippetSupport = true
    server_settings.filetypes = {
      'astro', 'html', 'typescriptreact', 'javascriptreact', 'css', 'scss', 'sass', 'less'
    }
    server_settings.init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          -- this was expanding bem classes in a way I didnt' like: 'main__container' -> "main main_container"
          ["bem.enabled"] = false,
        }
      }
    }
  end

  if server == 'graphql' then
    server_settings.cmd = { "graphql-lsp", "server", "-m", "stream" }
    server_settings.filetypes = { "graphql", "typescriptreact", "typescript" }
    -- server_settings.settings = { 'graphql-config.load.legacy' = true }
  end

  lspconfig[server].setup(server_settings)
end
