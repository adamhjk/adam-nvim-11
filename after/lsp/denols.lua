return {
  workspace_required = true,
  root_markers = { "deno.json" },
  root_dir = function(bufnr, on_dir)
    local root_path = vim.fs.find("deno.json", {
      upward = true,
      type = "file",
      path = vim.fn.getcwd(),
    })[1]

    if root_path then
      local deno_json = vim.fn.readfile(root_path)
      local content = table.concat(deno_json, "\n")

      -- Don't enable denols if this is a workspace root
      if string.find(content, "workspace") then
        return
      end

      on_dir(vim.fn.fnamemodify(root_path, ":h"))
    end
  end,
  settings = {
    typescript = {
      inlayHints = {
        includeInlayEnumMemberValueHints = true,
        includeInlayFunctionLikeReturnTypeHints = true,
        includeInlayFunctionParameterTypeHints = true,
        includeInlayParameterNameHints = "all", -- 'none' | 'literals' | 'all';
        includeInlayParameterNameHintsWhenArgumentMatchesName = true,
        includeInlayPropertyDeclarationTypeHints = true,
        includeInlayVariableTypeHints = false,
      },
    },
  },

}
