return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = function(_, opts)
      -- 1. Ensure the sidebar stays docked and doesn't replace editor windows
      opts.window = opts.window or {}
      opts.window.position = "left"

      -- Explicitly ensure Neo-tree doesn't try to close itself when files open
      if opts.filesystem then
        opts.filesystem.follow_current_file = { enabled = true }
      end
    end,
    -- 2. Launch on startup, EXCEPT when the LazyVim dashboard is visible
    init = function()
      vim.api.nvim_create_autocmd("VimEnter", {
        pattern = "*",
        group = vim.api.nvim_create_augroup("NeotreeOnOpen", { clear = true }),
        once = true,
        callback = function()
          vim.schedule(function()
            local current_ft = vim.bo.filetype

            -- Only open Neo-tree if no file was passed and dashboard is not active
            if
              vim.fn.argc() == 0
              and current_ft ~= "dashboard"
              and current_ft ~= "alpha"
              and current_ft ~= "snacks_dashboard"
            then
              vim.cmd("Neotree show")
              -- Switch window focus from Neo-tree back to the main layout/empty buffer
              vim.cmd("wincmd l")
            end
          end)
        end,
      })
    end,
  },
}
