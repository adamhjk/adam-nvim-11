vim.g.mapleader = ','
vim.g.maplocalleader = ','

vim.opt.spelllang = 'en_us'
vim.opt.spell = false
local prefix = vim.env.XDG_CONFIG_HOME or vim.fn.expand '~/.config'
vim.opt.undodir = { prefix .. '/nvim/.undo//' }
vim.opt.backupdir = { prefix .. '/nvim/.backup//' }
vim.opt.directory = { prefix .. '/nvim/.swp//' }

vim.o.winborder = 'rounded'
vim.o.hlsearch = false
vim.wo.number = true
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.breakindent = true
vim.o.undofile = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.wo.signcolumn = 'yes'
vim.o.updatetime = 250
vim.o.timeoutlen = 300
vim.o.completeopt = 'fuzzy,menuone,noselect'
vim.o.termguicolors = true
vim.o.tabstop = 2
vim.o.softtabstop = 0
vim.o.shiftwidth = 2
vim.o.expandtab = true

-- Dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

require('config.lazy')
require('config.keybindings')
require('telescope').load_extension('fzf')

vim.lsp.config("*", {
  capabilities = vim.lsp.protocol.make_client_capabilities()
})

vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
  callback = function(event)
    local map = function(keys, func, desc, mode)
      mode = mode or 'n'
      vim.keymap.set(mode, keys, func, { buffer = event.buf, desc = 'LSP: ' .. desc })
    end

    -- Code actions
    map('<leader>la', vim.lsp.buf.code_action, 'Code [A]ction')

    local client = vim.lsp.get_client_by_id(event.data.client_id)
    local function client_supports_method(method, bufnr)
      if vim.fn.has 'nvim-0.11' == 1 then
        return client:supports_method(method, bufnr)
      else
        return client.supports_method(method, { bufnr = bufnr })
      end
    end
    if client and client_supports_method(client, vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
      map('<leader>th', function()
        vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled { bufnr = event.buf })
      end, '[T]oggle Inlay [H]ints')
    end
  end
})
