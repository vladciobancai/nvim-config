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
  config = function(_, opts)
    vim.opt.termguicolors = true

    opts.options.separator_style = "slant"
    opts.highlights = require("catppuccin.special.bufferline").get_theme()

    require("bufferline").setup(opts)
  end,
}
