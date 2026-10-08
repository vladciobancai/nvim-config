return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    -- Override default configurations here
    preset = "modern", -- Options: "classic", "modern", "helix"
    win = {
      border = "rounded",
    },
  },
  config = function(_, opts)
    local wk = require("which-key")
    wk.setup(opts)

    -- Register descriptive labels for custom keymap prefixes
    wk.add({
      { "<leader>f", group = "file/find" }, -- overrides or sets group name
      { "<leader>x", group = "diagnostics/quickfix" },

      -- You can also bind keys directly through which-key with descriptions
      { "<leader>gY", "<cmd>GrugFar<cr>", desc = "Search and Replace" },
    })
  end,
}
