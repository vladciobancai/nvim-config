return {
  {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    opts = {
      image = {
        enabled = true,
        force = true, -- Forces iTerm2 to try rendering graphics anyway
      },
      explorer = {
        enabled = false,
      },
    },
  },
}
