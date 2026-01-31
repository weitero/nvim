# nvim

Personal Neovim configuration adapted from **LazyVim**.

- Plugin manager: **lazy.nvim**
- External tooling (LSP servers / formatters / linters): **mason.nvim** (+ mason-tool-installer)
- LSP configuration: **nvim-lspconfig**
- Formatting: **conform.nvim**
- Linting: **nvim-lint**
- Autocompletion: **blink.cmp**

## Requirements

- Neovim 0.11+ (uses `vim.lsp.config`)
- Git
- Nerd Font (recommended for icons)

## Install

```sh
git clone https://github.com/weitero/nvim.git ~/.config/nvim
nvim
```

On first launch, `lazy.nvim` bootstraps itself and installs plugins.

## What’s included

- Plugins: `lazy.nvim`
- Tooling: `mason.nvim` + `mason-lspconfig.nvim` + `mason-tool-installer.nvim`
- LSP: `nvim-lspconfig` (configured via `vim.lsp.config`)
- Formatting: `conform.nvim` (format-on-save, LSP fallback)
- Linting: `nvim-lint` (on write/insert-leave/text-changed)
- Completion: `blink.cmp` (+ `blink.compat`)

## Layout

- [init.lua](init.lua): entry point
- [lua/config/lazy.lua](lua/config/lazy.lua): lazy.nvim bootstrap + spec import
- [lua/config/](lua/config/): options, keymaps, autocmds, diagnostics
- [lua/plugins/](lua/plugins/): plugin specs
  - [lua/plugins/init.lua](lua/plugins/init.lua): loads core config modules early
  - [lua/plugins/lang/](lua/plugins/lang/): per-language setup (LSP/formatters/linters)
  - [lua/plugins/extended/](lua/plugins/extended/): optional/extra modules

## Usage

- `:Lazy` / `:Lazy sync` — manage plugin state
- `:Mason` — install/update external tools
- `<leader>f` — format (normal/visual)
- `:ConformInfo` — formatter status

## Defaults

- Leader: `<Space>`; local leader: `\\` (set during lazy bootstrap)
- Colorscheme: `catppuccin` (with `auto-dark-mode.nvim`)
- UI: `noice.nvim`, `nvim-notify`, `lualine`, `bufferline`, `dashboard-nvim`, `which-key`
- Treesitter: highlighting + incremental selection + textobjects + context (+ refactor helpers)
- Lua formatting: `stylua` via conform (LuaLS formatting is not used by default)

## VS Code (VSCode Neovim)

When `vim.g.vscode` is set, this config only loads a small allowlist of plugins to reduce conflicts. See [lua/config/lazy.lua](lua/config/lazy.lua).

## Troubleshooting

- Plugins not loading: run `:Lazy sync`, then restart Neovim
- LSP not starting: check `:Mason` and `:LspInfo`
- Formatting not running: check `:Mason`, then `:ConformInfo`
- Lint not running: see `linters_by_ft` in [lua/plugins/lang/](lua/plugins/lang/)
