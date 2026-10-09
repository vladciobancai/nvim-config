return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "FzfLua",
  keys = {
    { "<leader><space>", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>ff", "<cmd>FzfLua files<cr>", desc = "Find Files" },
    { "<leader>fg", "<cmd>FzfLua live_grep<cr>", desc = "Live Grep" },
    { "<leader>fb", "<cmd>FzfLua buffers<cr>", desc = "Buffers" },
    { "<leader>fh", "<cmd>FzfLua oldfiles<cr>", desc = "History (Oldfiles)" },
    { "<leader>fr", "<cmd>FzfLua resume<cr>", desc = "Resume Last Search" },
  },
  opts = function()
    -- Applies the 'fzf-native' and 'hide' profiles as a baseline
    return {
      { "fzf-native", "hide" },
    }
  end,
}
