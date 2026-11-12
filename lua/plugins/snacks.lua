local M = {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  keys = {
    {
      "<leader>s",
      function()
        Snacks.picker.smart()
      end,
      desc = "Smart Find Files",
    },
    {
      "<leader>e",
      function()
        Snacks.explorer()
      end,
      desc = "Toggle Explorer",
    },
    {
      "<leader>ff",
      function()
        Snacks.picker.files()
      end,
      desc = "Find Files",
    },
    {
      "<leader>fw",
      function()
        Snacks.picker.grep()
      end,
      desc = "Live Grep",
    },
    {
      "<leader>fr",
      function()
        Snacks.picker.recent()
      end,
      desc = "Recents",
    },
    {
      "<leader>fb",
      function()
        Snacks.picker.buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>cd",
      function()
        Snacks.picker.diagnostics()
      end,
      desc = "Workspace Diagnostics",
    },
    {
      "<leader>ca",
      function()
        vim.lsp.buf.code_action()
      end,
      desc = "Code Actions",
      mode = { "n", "v" },
    },
    {
      "gr",
      function()
        Snacks.picker.lsp_references()
      end,
      desc = "References",
    },
    {
      "gd",
      function()
        Snacks.picker.lsp_definitions()
      end,
      desc = "Go to Definition",
    },
    {
      "gI",
      function()
        Snacks.picker.lsp_implementations()
      end,
      desc = "Go to Implementation",
    },
    {
      "gw",
      function()
        Snacks.picker.lsp_workspace_symbols()
      end,
      desc = "Lsp Workspace Symbols",
    },
    {
      "<leader>gg",
      function()
        Snacks.lazygit()
      end,
      desc = "Lazygit",
    },
    {
      "<leader>gl",
      function()
        Snacks.lazygit.log()
      end,
      desc = "Lazygit Log",
    },
    { "<Tab>", "<cmd>bnext<CR>", desc = "Next buffer" },
    { "<S-Tab>", "<cmd>bprevious<CR>", desc = "Previous buffer" },
    {
      "<leader>bd",
      function()
        Snacks.bufdelete()
      end,
      desc = "Delete buffer",
    },
    {
      "<leader>bo",
      function()
        Snacks.bufdelete.other()
      end,
      desc = "Delete other buffers",
    },
    {
      "<leader>sm",
      function()
        Snacks.picker.marks()
      end,
      desc = "Marks",
    },
  },
  opts = {
    explorer = { enabled = true },
    picker = { enabled = true },
    lazygit = { enabled = true },
    indent = { enabled = true },
    scope = { enabled = true },
  },
}

return M
