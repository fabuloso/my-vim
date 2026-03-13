return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    panel = { enabled = true },
    suggestion = {
      enabled = false,
      auto_trigger = true,
      hide_during_completion = true,
      debounce = 75,
      keymap = {
        accept = "<c-j>",
        next = "<c-l>",
        prev = "<c-u>",
        dismiss = "<c-y>",
      },
    },
    server_opts_overrides = {},
  },
}
