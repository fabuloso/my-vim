return {
  "folke/lazydev.nvim",
  ft = "lua",
  opts = {
    library = {
      -- Load luvit types when the `vim.uv` word is found
      { path = "${3rd}/luv/library", words = { "vim%.uv" } },
      -- Load snacks types
      { path = "snacks.nvim", words = { "Snacks" } },
      -- Always load lazy.nvim types
      "lazy.nvim",
    },
  },
}
