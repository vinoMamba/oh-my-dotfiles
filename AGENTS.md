# Agent Guidelines for Neovim Configuration

## Code Style
- **Indentation**: 2 spaces (no tabs)
- **Imports**: Use `require "module.path"` syntax
- **Naming**: snake_case for variables/functions, PascalCase for plugins
- **Formatting**: Follow existing Lua patterns in the codebase

## Key Conventions
- Leader key is space (`vim.g.mapleader = " "`)
- Plugin configuration in `/lua/plugins/*.lua` files
- LSP servers configured in `/lua/lsp/servers/*.lua`
- Use `opts = {}` pattern for plugin configuration

## Error Handling
- Use `pcall()` for safe plugin loading
- Follow Neovim's built-in error reporting patterns

## Testing
- No formal test framework - validate changes by reloading Neovim
- Use `:Lazy sync` to update plugins after changes
- Test keymaps with actual usage scenarios

## Build/Lint Commands
- Format: `stylua lua/` (if stylua installed)
- Lint: Manual review recommended
- Reload: `:Lazy reload` or restart Neovim

## Plugin Management
- Managed by Lazy.nvim plugin manager
- Add new plugins to `/lua/plugins/` directory
- Run `:Lazy sync` to install/update
