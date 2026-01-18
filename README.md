# nvim

Personal Neovim configuration adapted from **LazyVim**.

- Plugin manager: **lazy.nvim**
- External tooling (LSP servers / formatters / linters): **mason.nvim**
- LSP configuration: **nvim-lspconfig**
- Formatting: **conform.nvim**
- Autocompletion: **blink-cmp**

## Requirements

- Neovim (recent stable is recommended)
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

- `init.lua`: entry point (loads the lazy.nvim bootstrap)
- `lua/config/`: core configuration
  - `options.lua`: `vim.opt` defaults
  - `keymaps.lua`: keymaps
  - `autocmds.lua`: autocommands
  - `diagnostics.lua`: diagnostics UI/behavior
  - `lazy.lua`: lazy.nvim bootstrap + plugin spec import
- `lua/plugins/`: plugin specs (grouped by area)
  - `lang/`: language-specific setup (LSP, formatting, extra tools)
  - `extended/`: optional/extra modules

## How it works

### Plugins (lazy.nvim)

Plugin specs live under `lua/plugins/` and are imported via the lazy.nvim setup
in `lua/config/lazy.lua`.

Useful commands:

- `:Lazy` — manage / update plugins
- `:Lazy sync` — sync plugin state to specs

### Tooling (mason.nvim)

Third-party binaries (LSP servers, formatters, linters, debuggers) are
installed/managed via mason.

Useful commands:

- `:Mason` — install/update tools

### LSP (nvim-lspconfig)

Language servers are configured through `nvim-lspconfig` in the language modules
under `lua/plugins/lang/`.

### Formatting (conform.nvim)

Formatters are configured through `conform.nvim` (see formatting-related plugin
specs under `lua/plugins/`).

Typical usage:

- `:Format` (if mapped/defined by your config) or format-on-save depending on
  the language module.

### Completion (blink-cmp)

Autocompletion is provided by `blink-cmp` (see
`lua/plugins/extended/coding/blink-cmp.lua`).

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
- There is a small VS Code integration guard: when `vim.g.vscode` is set, only
  an allowlist of plugins is loaded.

## Troubleshooting

- Plugins not loading / odd state:
  - run `:Lazy sync`, then restart Neovim
- LSP not starting:
  - check `:Mason` for server installation
  - check `:LspInfo` for active client status and errors
- Formatter not running:
  - confirm the formatter is installed in `:Mason`
  - check `conform.nvim` configuration in formatting-related plugin specs
