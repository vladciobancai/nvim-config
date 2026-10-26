-- Leaders must be set before lazy.nvim loads, so that plugin keymaps pick them up
vim.g.mapleader = " "
vim.g.maplocalleader = ","

local python = vim.fn.expand("~/.pyenv/versions/neovim/bin/python")
if vim.fn.executable(python) == 1 then
  vim.g.python3_host_prog = python
end

-- bootstrap lazy.nvim, LazyVim and your plugins
-- (config.options, config.keymaps and config.autocmds are loaded by LazyVim)
require("config.lazy")
