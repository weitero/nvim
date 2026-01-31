# nvim

Personal Neovim configuration adapted from **LazyVim**.

- Plugin manager: **lazy.nvim**
- External tooling (LSP servers / formatters / linters): **mason.nvim** (+ mason-tool-installer)
- LSP configuration: **nvim-lspconfig**
- Formatting: **conform.nvim**
- Linting: **nvim-lint**
- Autocompletion: **blink.cmp**

## Requirements

- Neovim **0.11+** (this config uses `vim.lsp.config`)
- Git
- A Nerd Font (recommended for icons)

## Install

1. Back up your existing config.
2. Clone this repo into your Neovim config directory:

```sh
git clone https://github.com/weitero/nvim.git ~/.config/nvim
```

3. Start Neovim:

```sh
nvim
```

On first launch, `lazy.nvim` is bootstrapped automatically and plugins are
installed.

## Layout

- `init.lua`: entry point
- `lua/config/lazy.lua`: lazy.nvim bootstrap + plugin spec import
- `lua/config/`: core modules
  - `options.lua`: `vim.opt` defaults
  - `keymaps.lua`: keymaps
  - `autocmds.lua`: autocommands
  - `diagnostics.lua`: diagnostics UI/behavior
- `lua/plugins/`: plugin specs (grouped by area)
  - `init.lua`: loads core config modules early (options/autocmds/diagnostics/keymaps)
  - `lang/`: language-specific setup (LSP, formatting, extra tools)
  - `extended/`: optional/extra modules

## How it works

### Plugins (lazy.nvim)

Plugin specs live under `lua/plugins/` and are imported via the lazy.nvim setup
in `lua/config/lazy.lua`.

Core config (`lua/config/*.lua`) is loaded from `lua/plugins/init.lua` so it runs
as part of the lazy spec import.

Useful commands:

- `:Lazy` — manage / update plugins
- `:Lazy sync` — sync plugin state to specs

### Tooling (mason.nvim)

Third-party binaries (LSP servers, formatters, linters, debuggers) are
installed/managed via mason.

This config uses `mason-tool-installer.nvim` to automatically ensure some tools
are installed (globally and per-language modules).

Useful commands:

- `:Mason` — install/update tools

### LSP (nvim-lspconfig)

Language servers are configured through `nvim-lspconfig` in the language modules
under `lua/plugins/lang/`.

### Formatting (conform.nvim)

Formatters are configured through `conform.nvim` (see formatting-related plugin
specs under `lua/plugins/`).

Typical usage:

- `<leader>f` to format (normal/visual)
- `:ConformInfo` for status
- format-on-save is enabled (with LSP fallback)

### Completion (blink.cmp)

Autocompletion is provided by `blink.cmp` (see
`lua/plugins/extended/coding/blink-cmp.lua`).

## Notable defaults

- Leader: `<Space>`; local leader: `\\`
- Colorscheme: `catppuccin` (with `auto-dark-mode.nvim`)
- UI: `noice.nvim`, `nvim-notify`, `lualine`, `bufferline`, `dashboard-nvim`, `which-key`
- Treesitter: highlighting + incremental selection + textobjects + context
- Formatting key: `<leader>f`

## VS Code integration

When `vim.g.vscode` is set (e.g. by VSCode Neovim), this config only loads a
small allowlist of plugins to reduce conflicts. The allowlist lives in
`lua/config/lazy.lua`.

## Customization

- Add/adjust options: `lua/config/options.lua`
- Add keymaps: `lua/config/keymaps.lua`
- Add a plugin:
  - create a new spec file under `lua/plugins/` (or `lua/plugins/extended/`)
  - or extend an existing file in the appropriate category
- Language-specific behavior: edit the corresponding file in `lua/plugins/lang/`

## Notes

- This config sets `mapleader` to `<Space>` and `maplocalleader` to `\\` in the
  lazy.nvim bootstrap.
- Formatting is driven by `conform.nvim`; LuaLS formatting is disabled in favor
  of external formatters.

## Troubleshooting

- Plugins not loading / odd state:
  - run `:Lazy sync`, then restart Neovim
- LSP not starting:
  - check `:Mason` for server installation
  - check `:LspInfo` for active client status and errors
- Formatter not running:
  - confirm the formatter is installed in `:Mason`
  - check `conform.nvim` configuration in formatting-related plugin specs
  - run `:ConformInfo`

- Lint not running:
  - this uses `nvim-lint` and runs on common edit events
  - check the language module under `lua/plugins/lang/` for `linters_by_ft`
