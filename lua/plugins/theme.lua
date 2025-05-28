return {
  {
    'ellisonleao/gruvbox.nvim',
    opts = { contrat = 'hard' },
    priority = 1000,
    lazy = false,
    config = function()
      vim.cmd.colorscheme('gruvbox')
    end,
  },
}
