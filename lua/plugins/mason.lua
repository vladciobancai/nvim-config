return {
  "mason-org/mason.nvim",
  opts = {
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
    ui = {
      check_outdated_packages_on_open = true,
      icons = {
        package_installed = "✓",
        package_pending = "➜",
        package_uninstalled = "✗",
      },
    },
  },
}
