# nvim

Personal Neovim configuration with built-in package management and LSP setup.

## Requirements

- Neovim 0.12+
- Git
- Nerd Font (recommended)

## Install

```sh
git clone https://github.com/weitero/nvim.git ~/.config/nvim
nvim
```

Plugins are installed with Neovim's `vim.pack` on startup.

## Included

- LSP: `nvim-lspconfig` with `vim.lsp.config`, using globally installed mise executables
- Completion and snippets: `mini.completion` and `mini.snippets`
- Formatting: `conform.nvim` using globally installed mise tools
- Linting: `nvim-lint` using globally installed mise tools
- Syntax and text objects: Treesitter
- Navigation and editing: `mini.pick`, Flash, Oil, persistence, and more
- Colorscheme: Catppuccin

## Layout

- [init.lua](init.lua): entry point
- [lua/pack.lua](lua/pack.lua): leaders and plugin modules
- [lua/plugins/](lua/plugins/): plugin configuration
- [plugin/](plugin/): options, keymaps, autocmds, and diagnostics

## Usage

- `<Space>f` or `:Format` — format the current buffer or range
- `:checkhealth` — check the Neovim environment
- `:LspInfo` — inspect active language servers

The local leader is `\\`. When used through VSCode Neovim, the plugin setup is
skipped. LSP servers, formatters, and linters are managed by mise and installed
globally so they are shared with VS Code.
