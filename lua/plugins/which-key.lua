return {
  'folke/which-key.nvim',
  event = "VeryLazy",
  opts = {
    spec = {
      { "<leader>f", group = "Find" },
      { "<leader>b", group = "Buffer" },
      { "<leader>c", group = "Code" },
      { "<leader>x", group = "Diagnostics" },
      { "<leader>a", group = "AI" },
      { "<leader>g", group = "Git" },
    },
  },
}
