local M = {}

local status_ok, lspconfig = pcall(require, 'lspconfig')
if not status_ok then
  return
end

M.setup = function()
  -- do the setup stuff
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true

  lspconfig.emmet_ls.setup({
    capabilities = capabilities,
    filetypes = { 'html', 'typescriptreact', 'javascriptreact', 'css', 'scss', 'sass', 'less' },
    init_options = {
      html = {
        options = {
          -- For possible options, see: https://github.com/emmetio/emmet/blob/master/src/config.ts#L79-L267
          ["bem.enabled"] = true
        }
      }
    }
  })
end

return M
