return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  keys = {
    { "<leader>ff", "<cmd>FzfLua files<CR>",                desc = "Find Files" },
    { "<leader>fw", "<cmd>FzfLua live_grep<CR>",            desc = "Live Grep" },
    { "<leader>fr", "<cmd>FzfLua oldfiles<CR>",             desc = "Recents" },
    { "<leader>fb", "<cmd>FzfLua buffers<CR>",              desc = "Buffers" },
    { "<leader>cd", "<cmd>FzfLua diagnostics_workspace<CR>", desc = "Workspace Diagnostics" },
    { "<leader>ca", "<cmd>FzfLua lsp_code_actions<CR>",     desc = "Code Actions" },
    { "gr",         "<cmd>FzfLua lsp_references<CR>",       desc = "References" },
    { "gd",         "<cmd>FzfLua lsp_definitions<CR>",      desc = "Go to Definition" },
    { "gI",         "<cmd>FzfLua lsp_implementations<CR>",  desc = "Go to Implementation" },
  },
}
