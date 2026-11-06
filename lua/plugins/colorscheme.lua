return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = false,
    priority = 1000,
    opts = {
      flavour = "mocha",
      integrations = {
        fzf = true,
        neotree = true,
        bufferline = true,
        snacks = true,
      },
    },
    config = function(_, opts)
      vim.opt.termguicolors = true
      require("catppuccin").setup(opts)
      vim.cmd.colorscheme("catppuccin-mocha")
    end,
  },
}
