-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out,                            "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Make sure to setup `mapleader` and `maplocalleader` before
-- loading lazy.nvim so that mappings are correct.
-- This is also a good place to setup other settings (vim.opt)
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"
vim.g.lazyvim_check_order = false
-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    { import = "plugins" },
  },
  -- Configure any other settings here. See the documentation for more details.
  install = { colorscheme = { "catppuccin-mocha" } },
  checker = { enabled = true }
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Could be '●', '▎', 'x'
    spacing = 2,
  },
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = "✗",
      [vim.diagnostic.severity.WARN]  = "▲",
      [vim.diagnostic.severity.INFO]  = "ℹ",
      [vim.diagnostic.severity.HINT]  = "➤",
    },
  },
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})

local orig_handler = vim.lsp.handlers["textDocument/publishDiagnostics"]

vim.lsp.handlers["textDocument/publishDiagnostics"] = function(err, result, ctx, config)
  -- Se non c'è result o diagnostics, lascia tutto com'è
  if not result or type(result.diagnostics) ~= "table" then
    return orig_handler(err, result, ctx, config)
  end

  for _, d in ipairs(result.diagnostics) do
    -- 1) A volte tags è non-table (stringa, numero, ecc.) → lo annulliamo
    if d.tags ~= nil and type(d.tags) ~= "table" then
      d.tags = nil
    end

    -- 2) A volte viene passato un "oggetto" invece di un array numerico
    --    Se la tabella non ha indice 1, la trattiamo come non valida
    if type(d.tags) == "table" and d.tags[1] == nil then
      d.tags = nil
    end
  end

  return orig_handler(err, result, ctx, config)
end

vim.keymap.set("n", "<leader>gg", "<cmd>LazyGit<cr>", { silent = true })

vim.opt.number = true
vim.opt.mouse = "a"
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = false
vim.opt.wrap = true
vim.opt.breakindent = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
