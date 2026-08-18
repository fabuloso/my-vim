# Neovim Configuration

## Architecture

This is a Neovim configuration built on **[LazyVim](https://www.lazyvim.org/)** with **[lazy.nvim](https://github.com/folke/lazy.nvim)** as the package manager.

```
init.lua          ← bootstrap lazy.nvim, set globals/options, configure diagnostics
lua/plugins/      ← one file per plugin (or logical group); each returns a lazy.nvim spec
lua/config/       ← (reserved for future config modules)
lazy-lock.json    ← lockfile; update via :Lazy update
lazyvim.json      ← LazyVim extras/version tracking
```

### Plugin spec conventions

Each file in `lua/plugins/` returns a lazy.nvim plugin spec. Two common patterns are used:

```lua
-- Pattern 1: inline return (simple plugins)
return { "author/plugin", opts = { ... } }

-- Pattern 2: local M table (plugins needing M.config / M.init)
local M = { "author/plugin", ... }
M.config = function() ... end
return M
```

### Global helpers (defined in `lua/plugins/code-companion.lua`)

These are exposed as `_G` globals and can be used anywhere:

| Helper | Signature | Purpose |
|--------|-----------|---------|
| `key` | `key(lhs, rhs, desc, modes?, opts?)` | Build a lazy.nvim `keys` entry |
| `lkey` | `lkey(lhs, rhs, desc, modes?)` | Same but prepends `<leader>` to `lhs` |
| `lgroup` | `lgroup(lhs, group)` | Build a which-key group entry with `<leader>` prefix |
| `scratch` | `scratch()` | Open a scratch buffer (prompts for filetype) |
| `close_win` | `close_win()` | Safely close the current window |

Also set: `_G.opt = vim.opt`, `_G.fn = vim.fn`, `_G.api = vim.api`.

## Key Plugin Roles

| Concern | Plugin |
|---------|--------|
| Colorscheme | `cyberdream.nvim` (transparent, 50% saturation) |
| Completion | `blink.cmp` + `LuaSnip` + `friendly-snippets` |
| LSP | `nvim-lspconfig` + `mason-lspconfig` (lua_ls, pyright, ts_ls, graphql, phpactor) |
| Rust LSP | `rustaceanvim` (replaces lspconfig for Rust; runs clippy on save) |
| Elixir LSP | `elixir-tools.nvim` (NextLS + ElixirLS) |
| Formatting | `conform.nvim` — rustfmt (Rust), php_cs_fixer (PHP), LSP fallback otherwise; runs on save |
| File picker/explorer | `snacks.nvim` (Snacks.picker + Snacks.explorer) |
| Diagnostics panel | `trouble.nvim` |
| Notifications/cmdline | `noice.nvim` |
| Git hunk signs | `gitsigns.nvim` |
| Git TUI | `lazygit.nvim` |
| AI coding assistant | `codecompanion.nvim` using the Copilot adapter (model: `claude-sonnet-4.6`) |
| Copilot inline | `copilot.lua` (panel enabled, inline suggestions disabled — handled by codecompanion) |
| Keybinding hints | `which-key.nvim` |

## Keybinding Groups (`<leader>` = `<Space>`)

| Prefix | Group |
|--------|-------|
| `<leader>f` | Find |
| `<leader>b` | Buffer |
| `<leader>c` | Code |
| `<leader>x` | Diagnostics |
| `<leader>a` | AI |
| `<leader>g` | Git |

Notable bindings: `<leader>s` smart file find, `<leader>e` explorer, `<leader>fw` live grep, `<leader>ac` AI chat, `<leader>aa` AI actions, `<leader>ai` AI inline, `gd`/`gr`/`gI` go-to-definition/references/implementations (all via Snacks picker).

## Editor Defaults (set in `init.lua`)

- 2-space indent (`tabstop=2`, `shiftwidth=2`, `expandtab=true`)
- `ignorecase` + `smartcase` for search
- `wrap` + `breakindent` enabled
- `hlsearch` disabled
- Folding via Treesitter (`foldmethod=expr`, `foldlevel=9`)

## LSP Notes

- `lua_ls` is explicitly enabled via `vim.lsp.enable()` (Neovim 0.11+ API); other servers follow the same pattern.
- `.luarc.json` declares `vim`, `format`, and `on_attach` as known globals for the Lua LSP.
- A custom `textDocument/publishDiagnostics` handler in `init.lua` sanitizes malformed `tags` fields from LSP responses to prevent errors.
- Rust uses `rustaceanvim` exclusively — do **not** configure `rust-analyzer` through `lspconfig`.
- Elixir uses `elixir-tools.nvim` — do **not** configure `elixirls` through `lspconfig`.

## Adding a New Plugin

1. Create `lua/plugins/<name>.lua` returning a valid lazy.nvim spec.
2. Use `key()`/`lkey()` helpers for keymaps in the `keys` table.
3. Assign the keymap to the appropriate `<leader>` group (or add a new group in `which-key.lua`).
4. Run `:Lazy sync` to install; commit the updated `lazy-lock.json`.

## Profile System

Neovim reads the `NVIM_PROFILE` environment variable to determine which profile is active:

- **Not set** → `"home"` profile (default — all plugins except work-only ones)
- **`NVIM_PROFILE=work`** → `"work"` profile (all plugins enabled)

Two globals are available everywhere (defined in `init.lua`, before `lazy.setup`):

```lua
_G.profile   -- string: "home" | "work"
_G.is_work   -- function(): boolean
```

To make a plugin work-only, add `cond = is_work` to its lazy.nvim spec:

```lua
local M = {
  "author/work-only-plugin",
  cond = is_work,   -- skipped entirely when profile ~= "work"
}
```

**On the work machine:** add `export NVIM_PROFILE=work` to your shell profile (`.zshrc`, `.bashrc`, etc.).
