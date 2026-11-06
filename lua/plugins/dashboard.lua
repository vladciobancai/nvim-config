local function icon(code)
  return vim.fn.nr2char(code) .. " "
end

local icons = {
  update = icon(0xF06B0),
  files = icon(0xF0C7C),
  grep = icon(0xF0BB9),
  recent = icon(0xF02DA),
  config = icon(0xF0493),
  apps = icon(0xF08C6),
  quit = icon(0xF0206),
  project = icon(0xF0770),
}

local function footer_text()
  local ok, status = pcall(require, "lazy.status")
  if ok and status.has_updates() then
    return icons.update .. status.updates() .. " plugin updates available"
  end
  return "Happy hacking"
end

local function launch_app()
  if vim.fn.has("mac") ~= 1 then
    vim.notify("Apps launcher is macOS only", vim.log.levels.WARN)
    return
  end
  local apps = {}
  for _, dir in ipairs({ "/Applications", "/System/Applications" }) do
    for _, path in ipairs(vim.fn.globpath(dir, "*.app", false, true)) do
      apps[#apps + 1] = vim.fn.fnamemodify(path, ":t:r")
    end
  end
  table.sort(apps)
  require("fzf-lua").fzf_exec(apps, {
    prompt = "Apps> ",
    actions = {
      ["default"] = function(selected)
        if selected and selected[1] then
          vim.fn.jobstart({ "open", "-a", selected[1] }, { detach = true })
        end
      end,
    },
  })
end

return {
  "nvimdev/dashboard-nvim",
  event = "VimEnter",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  config = function()
    vim.api.nvim_create_autocmd("User", {
      pattern = "LazyCheck",
      callback = function()
        if vim.bo.filetype == "dashboard" then
          vim.cmd("DashboardUpdateFooter " .. footer_text():gsub(" ", "\\ "))
        end
      end,
    })

    require("dashboard").setup({
      theme = "hyper",
      change_to_vcs_root = true,
      hide = { statusline = true, tabline = true, winbar = true },
      config = {
        week_header = {
          enable = true,
        },
        disable_move = false,
        shortcut = {
          { desc = icons.apps .. "Apps", group = "Function", action = launch_app, key = "a" },
          {
            desc = icons.config .. "Config",
            group = "Constant",
            action = function()
              require("fzf-lua").files({ cwd = vim.fn.stdpath("config") })
            end,
            key = "c",
          },
          { desc = icons.files .. "Files", group = "DiagnosticOk", action = "FzfLua files", key = "f" },
          { desc = icons.grep .. "Grep", group = "DiagnosticWarn", action = "FzfLua live_grep", key = "g" },
          { desc = icons.recent .. "Recent", group = "Keyword", action = "FzfLua oldfiles", key = "r" },
          { desc = icons.update .. "Update", group = "DiagnosticHint", action = "Lazy update", key = "u" },
          { desc = icons.quit .. "Quit", group = "DiagnosticError", action = "qa", key = "q" },
        },
        packages = { enable = true },
        project = {
          enable = true,
          limit = 8,
          icon = icons.project,
          label = "Projects",
          action = function(path)
            require("fzf-lua").files({ cwd = path })
          end,
        },
        mru = { enable = true, limit = 10, icon = " ", label = "Recent", cwd_only = false },
        footer = function()
          return { "", footer_text() }
        end,
      },
    })
  end,
}
