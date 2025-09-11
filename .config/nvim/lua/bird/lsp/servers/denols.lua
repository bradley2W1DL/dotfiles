local lspconfig = require("lspconfig")

local function is_deno_project()
  local buf_root_dir = lspconfig.util.find_package_json_ancestor(vim.fn.expand('%'))
  local deno_files = { 'deno.json', 'deno.jsonc', 'deno.lock' }

  for _, filepath in ipairs(deno_files) do
    if vim.uv.fs_stat(buf_root_dir .. '/' .. filepath) ~= nil then
      print("Deno project detected: " .. filepath)
      return true
    end
  end

  return false
end

return {
  mason_managed = true,
  root_dir = lspconfig.util.root_pattern({ "deno.json", "deno.jsonc" }),
  single_file_support = false,
  settings = {
    deno = {
      -- todo this doesn't seem to work.  enable always true in denols config
      enable = is_deno_project(),
    }
  }
}
