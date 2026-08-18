return {
  "romgrk/barbar.nvim",
  dependencies = {
    "lewis6991/gitsigns.nvim", -- OPTIONAL: for git status integration
    "nvim-tree/nvim-web-devicons", -- OPTIONAL: for file icons
  },
  init = function()
    vim.g.barbar_auto_setup = false
  end,
  opts = {
    animation = true,
    auto_hide = false,
    tabpages = true,
    clickable = true,
    icons = {
      buffer_index = false,
      buffer_number = false,
      button = "",
      diagnostics = {
        [vim.diagnostic.severity.ERROR] = { enabled = true, icon = "ﬀ" },
        [vim.diagnostic.severity.WARN] = { enabled = true },
        [vim.diagnostic.severity.INFO] = { enabled = true },
        [vim.diagnostic.severity.HINT] = { enabled = true },
      },
      gitsigns = {
        added = { enabled = true, icon = "+" },
        changed = { enabled = true, icon = "~" },
        deleted = { enabled = true, icon = "-" },
      },
      filetype = {
        custom_colors = false,
        enabled = true,
      },
      separator = { left = "▎", right = "" },
      modified = { button = "●" },
      pinned = { button = "", filename = true },
      preset = "default",
    },
    sidebar_filetypes = {
      NvimTree = true,
      ["neo-tree"] = { event = "BufWipeout" },
    },
  },
  keys = {
    -- Buffer navigation
    { "<S-Tab>", "<cmd>BufferPrevious<CR>", desc = "Previous buffer" },
    { "<Tab>", "<cmd>BufferNext<CR>", desc = "Next buffer" },

    -- Buffer reordering
    { "<leader>b<", "<cmd>BufferMovePrevious<CR>", desc = "Move buffer left" },
    { "<leader>b>", "<cmd>BufferMoveNext<CR>", desc = "Move buffer right" },

    -- Goto buffer in position
    { "<leader>b1", "<cmd>BufferGoto 1<CR>", desc = "Go to buffer 1" },
    { "<leader>b2", "<cmd>BufferGoto 2<CR>", desc = "Go to buffer 2" },
    { "<leader>b3", "<cmd>BufferGoto 3<CR>", desc = "Go to buffer 3" },
    { "<leader>b4", "<cmd>BufferGoto 4<CR>", desc = "Go to buffer 4" },
    { "<leader>b5", "<cmd>BufferGoto 5<CR>", desc = "Go to buffer 5" },

    -- Buffer actions
    { "<leader>bp", "<cmd>BufferPin<CR>", desc = "Toggle pin buffer" },
    { "<leader>bd", "<cmd>BufferClose<CR>", desc = "Delete buffer" },
    { "<leader>bc", "<cmd>BufferClose<CR>", desc = "Close buffer" },
    { "<leader>bo", "<cmd>BufferCloseAllButCurrentOrPinned<CR>", desc = "Close other buffers" },
    { "<leader>bl", "<cmd>BufferCloseBuffersLeft<CR>", desc = "Close buffers to left" },
    { "<leader>br", "<cmd>BufferCloseBuffersRight<CR>", desc = "Close buffers to right" },

    -- Magic pick
    { "<leader>bw", "<cmd>BufferPick<CR>", desc = "Pick buffer" },
  },
}
