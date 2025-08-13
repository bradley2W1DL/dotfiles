return {
  mason_managed = true,
  capabilities = function(base_capabilities)
    base_capabilities.textDocument.completion.completionItem.snippetSupport = true
    return base_capabilities
  end,
  filetypes = {
    'astro', 'html', 'typescriptreact', 'javascriptreact', 'css', 'scss', 'sass', 'less'
  },
  init_options = {
    html = {
      options = {
        ["bem.enabled"] = false,
      }
    }
  }
}