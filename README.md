# My Neovim Config

Personal Neovim configuration built on [LazyVim](https://www.lazyvim.org/) with [lazy.nvim](https://github.com/folke/lazy.nvim).

## Requirements

- Neovim ≥ 0.11
- Git
- A [Nerd Font](https://www.nerdfonts.com/) in your terminal
- `make` (for building blink.cmp's Rust fuzzy engine)

## Installation

```bash
git clone git@github.com:fabuloso/my-vim.git ~/.config/nvim
```

Open Neovim — lazy.nvim will bootstrap itself and install all plugins automatically.

## Profiles

Two profiles are supported via the `NVIM_PROFILE` environment variable:

| Value | Plugins loaded |
|-------|----------------|
| *(not set)* | All plugins except work-only ones |
| `work` | All plugins |

**On the work machine**, add to your `.zshrc` / `.bashrc`:

```bash
export NVIM_PROFILE=work
```

## Key Plugins

| Concern | Plugin |
|---------|--------|
| Completion | `blink.cmp` + LuaSnip |
| LSP | nvim-lspconfig + Mason (lua, ts, python, graphql, php) |
| Rust | `rustaceanvim` (clippy on save) |
| Elixir | `elixir-tools.nvim` (NextLS + ElixirLS) |
| Formatting | `conform.nvim` (rustfmt, php-cs-fixer, LSP fallback) |
| Picker / Explorer | `snacks.nvim` |
| Diagnostics | `trouble.nvim` |
| Git | `gitsigns.nvim` + `lazygit.nvim` |
| AI | `codecompanion.nvim` (Copilot / Claude Sonnet 4.6) |
| Theme | `cyberdream.nvim` (transparent, colorblind-safe semantic palette) |

## Color Accessibility

The Cyberdream palette is adjusted for red-green color vision deficiency. Errors
and removals use vermilion, additions and success use bluish green, warnings use
amber/yellow, and informational states use blue/cyan. Diagnostic signs and
undercurls provide redundant non-color severity cues.

For consistent colors in terminal applications, Kitty's
`~/.config/kitty/current-theme.conf` and Ghostty's `~/.config/ghostty/config`
use the same ANSI palette. Reload Kitty's configuration or restart Ghostty
after changing either terminal configuration.

## Keybindings

`<leader>` = `Space`

| Key | Action |
|-----|--------|
| `<leader>s` | Smart file find |
| `<leader>e` | File explorer |
| `<leader>ff` | Find files |
| `<leader>fw` | Live grep |
| `<leader>fr` | Recent files |
| `<leader>ac` | AI chat |
| `<leader>aa` | AI actions |
| `<leader>ai` | AI inline |
| `<leader>xx` | Diagnostics panel |
| `<leader>gg` | LazyGit |
| `gd` | Go to definition |
| `gr` | References |
| `gI` | Implementations |

## Structure

```
init.lua          ← bootstrap, options, diagnostics config
lua/plugins/      ← one file per plugin, each returns a lazy.nvim spec
lazy-lock.json    ← lockfile (commit this)
```

### Adding a plugin

1. Create `lua/plugins/<name>.lua`
2. Use `lkey()` / `key()` globals for keymaps
3. For work-only plugins, add `cond = is_work`
4. Run `:Lazy sync`
