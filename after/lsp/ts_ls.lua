local vue_language_server_path = vim.fn.expand '$MASON/packages' ..
    '/vue-language-server' .. '/node_modules/@vue/language-server'

return {
  init_options = {
    plugins = {
      {
        name = "@vue/typescript-plugin",
        location = vue_language_server_path,
        languages = { "vue", "typescript" },
      },
    },
  },
  settings = {
    javascript = {
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
  root_markers = { "package.json" },
  root_dir = function(bufnr, on_dir)
    local root_path = vim.fs.find("package.json", {
      upward = true,
      type = "file",
      path = vim.fn.getcwd(),
    })[1]

    if root_path then
      local package_json = vim.fn.readfile(root_path)
      local content = table.concat(package_json, "\n")

      -- Don't enable ts_ls if this is the SI monorepo root
      if string.find(content, "SI monorepo") then
        return
      end

      on_dir(vim.fn.fnamemodify(root_path, ":h"))
    end
  end,
  workspace_required = true,
  filetypes = {
    "javascript",
    "typescript",
    "javascriptreact",
    "typescriptreact",
    "vue",
  },
}
