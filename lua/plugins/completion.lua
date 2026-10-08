return {
  -- 1. Disable the old nvim-cmp and its associated core dependencies
  { "hrsh7th/nvim-cmp", enabled = false },
  { "hrsh7th/cmp-nvim-lsp", enabled = false },
  { "hrsh7th/cmp-buffer", enabled = false },
  { "hrsh7th/cmp-path", enabled = false },
  { "saadparwaiz1/cmp_luasnip", enabled = false },

  -- 2. Configure blink.cmp as your primary completion engine
  {
    "saghen/blink.cmp",
    version = "*", -- Use a release tag to ensure stability
    opts = {
      -- Use Neovim 0.10+ native snippet engine instead of third-party Luasnip
      snippets = {
        expand = function(snippet)
          vim.snippet.expand(snippet)
        end,
        active = function(filter)
          return vim.snippet.active(filter)
        end,
        jump = function(direction)
          vim.snippet.jump(direction)
        end,
      },

      -- Configure your preferred completion keymaps
      keymap = {
        preset = "default", -- 'default', 'super-tab', or 'enter'

        -- Custom tweaks (optional):
        ["<C-y>"] = { "select_and_accept" },
        ["<Up>"] = { "select_prev", "fallback" },
        ["<Down>"] = { "select_next", "fallback" },
      },

      -- Define the semantic completion sources
      sources = {
        default = { "lsp", "path", "snippets", "buffer" },
      },

      -- Clean, minimal UI configuration for the completion window
      completion = {
        menu = {
          border = "rounded",
          draw = {
            columns = { { "label", "label_description", gap = 1 }, { "kind_icon", "kind", gap = 1 } },
          },
        },
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 200,
          window = { border = "rounded" },
        },
      },
    },
  },
}
