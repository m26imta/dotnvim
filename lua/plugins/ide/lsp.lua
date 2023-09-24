return{
  --
  -- LSP
  {
    "neovim/nvim-lspconfig",
    branch = "master",
    dependencies = {
      { 'williamboman/mason.nvim',
        cmd = { "Mason", "MasonInstall", "MasonInstallAll", "MasonUninstall", "MasonUninstallAll", "MasonLog" },
      },
      { 'williamboman/mason-lspconfig.nvim' },
    },
    event = "BufEnter",
    config = function()
      require("plugins.configs.ide.lsp")
    end,
  },
}
