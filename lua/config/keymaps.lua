-- NOTE: <leader>l, <esc>, visual < / >, <leader>cd (line diagnostics) and <C-s> (save)
-- are already provided by LazyVim.

vim.keymap.set("n", "<leader>M", ":Man ", { desc = "Open manpage" })

vim.keymap.set("n", "[d", function()
  vim.diagnostic.jump({ count = -1, float = { focus = false, scope = "cursor" } })
end, { desc = "Go to previous diagnostic and display" })

vim.keymap.set("n", "]d", function()
  vim.diagnostic.jump({ count = 1, float = { focus = false, scope = "cursor" } })
end, { desc = "Go to next diagnostic and display" })

-- WARN: Does not work, probably due to lazy loading
-- local blink_ok, _ = pcall(require, "blink.cmp")
-- if not blink_ok then
--   vim.keymap.set("i", "<C-space>", function()
--     return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-X><C-O>"
--   end, { desc = "trigger completion", expr = true })
--   vim.keymap.set("i", "<esc>", function()
--     return vim.fn.pumvisible() == 1 and "<C-e><esc>" or "<esc>"
--   end, { desc = "cancel completion", expr = true })
--   vim.keymap.set("i", "<cr>", function()
--     return vim.fn.pumvisible() == 1 and "<C-y>" or "<cr>"
--   end, { desc = "confirm completion", expr = true })
--   vim.keymap.set("i", "<C-k>", function()
--     return vim.fn.pumvisible() == 1 and "<C-p>" or "<C-k>"
--   end, { desc = "previous completion", expr = true })
--   vim.keymap.set("i", "<C-j>", function()
--     return vim.fn.pumvisible() == 1 and "<C-n>" or "<C-j>"
--   end, { desc = "previous completion", expr = true })
-- end

vim.keymap.set({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank - clipboard" })
vim.keymap.set({ "n", "x" }, "<leader>Y", '"+Y', { desc = "Yank - clipboard" })
-- NOTE: <leader>p is the yanky history (see plugins/yanky.lua)
vim.keymap.set("n", "<leader>P", '"+P', { desc = "Paste - clipboard" })

vim.keymap.set("n", "]<tab>", "<cmd>tabnext<cr>", { desc = "Next tab" })
vim.keymap.set("n", "[<tab>", "<cmd>tabprevious<cr>", { desc = "Previous tab" })

-- WARN: Does not work after move to treesitter main branch
-- vim.keymap.set("n", "vn", function()
--   local ts_utils = require("nvim-treesitter.ts_utils")
--   local node = ts_utils.get_node_at_cursor()
--   if not node then
--     return
--   end
--   local start_row, start_col, end_row, end_col = node:range()
--   vim.api.nvim_win_set_cursor(0, { start_row + 1, start_col })
--   vim.cmd("normal! v")
--   vim.api.nvim_win_set_cursor(0, { end_row + 1, end_col - 1 })
-- end, { desc = "Select current Treesitter node" })

-- <leader>s is the LazyVim search group, so "save file" lives on <C-s> (LazyVim default)
vim.keymap.set("n", "<leader>S", "<cmd>wa<cr>", { desc = "Save all files" })
