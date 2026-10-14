return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      -- Always show tabs, even if there's just one open
      -- This helps with the showing status, like unsaved changes or LSP info
      -- even with only one file open
      always_show_bufferline = true,
      -- Use smaller x for buffer tabs
      buffer_close_icon = "✕",
      -- Removes file type icons
      show_buffer_icons = true,
      -- Show buffer list number for quick selection
      numbers = function(opts)
        return string.format("%s", opts.raise(opts.ordinal))
      end,
      style_preset = require("bufferline").style_preset.no_italic,
    },
  },
  config = function()
    vim.opt.termguicolors = true

    -- Fetch highlights passing the dark background color required for slants
    local highlights = require("nord").bufferline.highlights({
      italic = true,
      bold = true,
      fill = "#181c24",
    })

    require("bufferline").setup({
      options = {
        separator_style = "slant",
      },
      highlights = highlights,
    })
  end,
}
