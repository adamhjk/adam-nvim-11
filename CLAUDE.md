# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Neovim Configuration Structure

This is a Neovim configuration using lazy.nvim as the plugin manager. The configuration follows a modular structure:

- `init.lua`: Main configuration entry point with core settings and LSP attach autocmd
- `lua/config/`: Core configuration modules
  - `lazy.lua`: lazy.nvim plugin manager bootstrap and setup
  - `keybindings.lua`: Global keybindings using which-key.nvim
- `lua/plugins/`: Plugin specifications for lazy.nvim
- `after/lsp/`: LSP server-specific configurations that override defaults

## Key Configuration Details

### Leader Key
- Leader key is set to comma (`,`)
- Most custom keybindings use `<leader>` prefix

### LSP Setup
The configuration uses Mason for LSP server management with these servers:
- `lua_ls`: Lua language server for Neovim configuration
- `ts_ls`: TypeScript language server with Vue.js support
- `denols`: Deno TypeScript runtime (workspace detection based on deno.json)
- `vue_ls`: Vue.js language server
- `rust_analyzer`: Rust language server

LSP servers have custom configurations in `after/lsp/` that handle workspace detection and inlay hints.

### Plugin Architecture
All plugins are defined as separate modules in `lua/plugins/` and imported via lazy.nvim's spec system. Key plugins include:
- blink.cmp: Completion engine with 'enter' keymap preset
- telescope.nvim: Fuzzy finder with extensive keybindings
- conform.nvim: Code formatting
- trouble.nvim: Diagnostics display
- oil.nvim: File explorer
- treesitter: Syntax highlighting

### Workspace Detection
- TypeScript projects: Detected by `package.json`
- Deno projects: Detected by `deno.json`
- LSP servers are workspace-aware and won't activate without proper root markers

## Common Operations

### Testing Configuration Changes
Restart Neovim to reload configuration changes, or use `:source %` when editing Lua files.

### Adding New Plugins
Create new files in `lua/plugins/` following the existing pattern. lazy.nvim will automatically discover and load them.

### LSP Server Configuration
Server-specific settings go in `after/lsp/{server_name}.lua` and should return a configuration table.