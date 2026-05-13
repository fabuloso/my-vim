return {
  "akinsho/bufferline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  keys = {
    { "<leader>bp", "<cmd>BufferLineTogglePin<CR>",            desc = "Toggle Pin" },
    { "<Tab>",      "<cmd>BufferLineCycleNext<CR>",            desc = "Next Buffer" },
    { "<S-Tab>",    "<cmd>BufferLineCyclePrev<CR>",            desc = "Prev Buffer" },
    { "<leader>bd", "<cmd>bdelete<CR>",                        desc = "Delete Buffer" },
  },
  opts = {
    options = {
      diagnostics = "nvim_lsp",
      always_show_bufferline = false,
      offsets = {},
    },
  },
}
