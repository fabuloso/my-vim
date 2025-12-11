_G.opt = vim.opt
_G.fn = vim.fn
_G.api = vim.api

function _G.close_win()
  return pcall(function()
    return api.nvim_win_close(0, false)
  end) or vim.cmd(":q")
end

function _G.scratch()
  local buf = api.nvim_create_buf(false, true)

  api.nvim_set_option_value("buftype", "nofile", { buf = buf })
  api.nvim_set_option_value("bufhidden", "hide", { buf = buf })
  api.nvim_set_option_value("swapfile", false, { buf = buf })
  api.nvim_set_current_buf(buf)

  local filetype = vim.fn.input("Filetype (optional): ")
  if filetype ~= "" then
    api.nvim_set_option_value("filetype", filetype, { buf = buf })
  end
end

function _G.missing_hls()
  vim.fn.setreg("z", table.concat(missing, "\n"))
end

function _G.lgroup(lhs, group)
  return { lhs = "<leader>" .. lhs, group = group }
end
function _G.key(lhs, rhs, desc, modes, opts)
  opts = opts or {}
  opts.desc = desc
  opts.mode = modes or { "n" }
  opts.noremap = opts.remap ~= true
  opts.silent = opts.silent ~= false
  return vim.tbl_extend("force", { lhs, rhs }, opts)
end
function _G.lkey(lhs, rhs, desc, modes)
  return key("<leader>" .. lhs, rhs, desc, modes)
end
-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
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

-- Setup lazy.nvim
require("lazy").setup({
  spec = "plugins",
  -- Configure any other settings here. See the documentation for more details.
  install = { colorscheme = { "catppuccin-mocha" } },
  checker = { enabled = true },
})

vim.diagnostic.config({
  virtual_text = {
    prefix = "●", -- Could be '●', '▎', 'x'
    spacing = 2,
  },
  signs = {
    Error = "✗",
    Warn = "▲",
    Info = "ℹ",
    Hint = "➤",
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
