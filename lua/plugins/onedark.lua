return {
  {
    'navarasu/onedark.nvim',
    opts = { style = 'warm' },
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme('onedark')
    end,
  },
}
