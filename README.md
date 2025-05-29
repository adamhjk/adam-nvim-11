# Neovim Configuration

A modern Neovim configuration using lazy.nvim plugin manager with LSP support, code formatting, and intelligent completion.

## Structure

```
~/.config/nvim/
├── init.lua                 # Main configuration entry point
├── lazy-lock.json          # Plugin version lockfile
├── after/
│   └── lsp/                # LSP server-specific configurations
│       ├── denols.lua      # Deno TypeScript runtime
│       └── ts_ls.lua       # TypeScript language server
└── lua/
    ├── config/             # Core configuration modules
    │   ├── lazy.lua        # Plugin manager bootstrap
    │   └── keybindings.lua # Global keybindings
    └── plugins/            # Plugin specifications
        ├── conform.lua     # Code formatting
        ├── lsp.lua         # Language server setup
        ├── oil.lua         # File explorer
        ├── telescope.lua   # Fuzzy finder
        ├── theme.lua       # Color scheme
        ├── treesitter.lua  # Syntax highlighting
        ├── trouble.lua     # Diagnostics display
        └── which-key.lua   # Keybinding help
```

## Features

- **Plugin Management**: [lazy.nvim](https://github.com/folke/lazy.nvim) for fast startup and plugin management
- **LSP Support**: Full language server protocol support with Mason for server management
- **Completion**: [blink.cmp](https://github.com/Saghen/blink.cmp) with fuzzy matching
- **File Navigation**: Telescope fuzzy finder and Oil file explorer
- **Code Formatting**: conform.nvim with automatic formatting
- **Syntax Highlighting**: Treesitter with advanced parsing
- **Workspace Detection**: Automatic LSP server selection based on project type

## Supported Languages

- **Lua**: `lua_ls` for Neovim configuration
- **TypeScript/JavaScript**: `ts_ls` with Vue.js support
- **Deno**: `denols` for Deno projects (detected by `deno.json`)
- **Vue.js**: `vue_ls` for Vue components
- **Rust**: `rust_analyzer` for Rust development

## Installation

### Prerequisites

- Neovim 0.10+ (required for LSP and lazy.nvim)
- Git (for plugin installation)
- A C compiler (for telescope-fzf-native compilation)
- Node.js (for TypeScript/JavaScript LSP servers)
- Rust (optional, for Rust development)
- Deno (optional, for Deno projects)

### Install

1. **Backup existing configuration** (if any):
   ```bash
   mv ~/.config/nvim ~/.config/nvim.backup
   ```

2. **Clone this configuration**:
   ```bash
   git clone <repository-url> ~/.config/nvim
   ```

3. **Start Neovim**:
   ```bash
   nvim
   ```

4. **Install plugins**: lazy.nvim will automatically install all plugins on first startup

5. **Install LSP servers**: Run `:Mason` and install desired language servers, or they'll be installed automatically when opening supported file types

## Configuration

### Leader Key

The leader key is set to comma (`,`). Most custom keybindings use the `<leader>` prefix.

### Key Bindings

- `<leader>ff` - Find files
- `<leader>fg` - Live grep
- `<leader>fb` - Find buffers
- `<leader>fh` - Find help tags
- `<leader>th` - Toggle inlay hints
- `<leader>e` - Open file explorer

### Customization

- **Add plugins**: Create new files in `lua/plugins/` following existing patterns
- **LSP settings**: Add server-specific configurations in `after/lsp/{server_name}.lua`
- **Keybindings**: Modify `lua/config/keybindings.lua`
- **Core settings**: Edit `init.lua` for Neovim options

### Workspace Detection

The configuration automatically detects project types:
- **TypeScript projects**: Detected by `package.json`
- **Deno projects**: Detected by `deno.json`
- **Rust projects**: Detected by `Cargo.toml`

LSP servers activate only in appropriate workspaces to avoid conflicts.

## Troubleshooting

- **Plugins not loading**: Run `:Lazy sync` to update plugins
- **LSP not working**: Check `:LspInfo` for server status and `:Mason` for installation
- **Performance issues**: Run `:Lazy profile` to identify slow plugins
- **Keybinding conflicts**: Use `:WhichKey` to see available bindings

## Updates

To update plugins and configuration:

```bash
# Update plugins
nvim --headless -c "Lazy! sync" -c "qa"

# Update configuration
cd ~/.config/nvim && git pull
```