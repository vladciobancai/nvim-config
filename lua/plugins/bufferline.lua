return {
  "akinsho/bufferline.nvim",
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
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
