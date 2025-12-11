local constants = {
  LLM_ROLE = "llm",
  USER_ROLE = "user",
  SYSTEM_ROLE = "system",
}

return {
  "olimorris/codecompanion.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "zbirenbaum/copilot.lua",
  },
  opts = {
    adapters = {
      acp = {
        opencode = function()
          return require("codecompanion.adapters").extend("claude_code", {
            name = "opencode",
            formatted_name = "OpenCode",
            commands = {
              default = { "opencode", "acp" },
            },
          })
        end,
      },
    },
    prompt_library = {
      ["Lsp fix"] = {
        strategy = "workflow",
        description = "Use a workflow to fix LSP issues in the current buffer with validation.",
        opts = {
          index = 5,
          is_default = true,
          short_name = "lsp_fix",
        },
        prompts = {
          {
            {
              name = "Collect Issues",
              role = constants.USER_ROLE,
              opts = { auto_submit = false },
              repeat_until = function(chat) return chat.tool_registry.flags.testing == true end,
              content = function()
                vim.g.codecompanion_yolo_mode = true
                return [[
Collect all #{lsp} diagnostics in buffer #{buffer} without repetition.
For each issue:
- Analyze the root cause
- Consider potential cascading effects on other code
- Prepare the fix using @{insert_edit_into_file}

Show a diff of the proposed changes for each issue, no any other text.
Then ask: "Apply these fixes? [y/n]"
]]
              end,
            },
          },
        },
      },
    },
    strategies = {
      chat = {
        name = "copilot",
        model = "claude-sonnet-4.5",
      },
      inline = {
        name = "copilot",
        model = "claude-sonnet-4.5",
      },
    },
    display = {
      action_palette = {
        provider = "snacks",
        opts = {
          show_default_actions = true,
        },
      },
    },
  },
  keys = {
    lkey("ac", function() require("codecompanion").chat() end, "chat"),
    lkey("aa", function() require("codecompanion").actions() end, "actions"),
    lkey("ai", function()
      local companion = require("codecompanion")
      local input = vim.fn.input("Enter your message: ")
      companion.inline({ message = input })
    end, "inline", { "n", "v" }),
  },
}
