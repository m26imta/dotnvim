return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  event = { "BufReadPost", "BufNewFile" },
  -- enabled = false,
  config = function()
    require("plugins.configs.ide.treesitter")
  end,
  dependencies = {
    {"windwp/nvim-ts-autotag"},
    {"windwp/nvim-autopairs"},
    {
      "numToStr/Comment.nvim",
      opts = {},
      keys = require("plugins.configs.keymaps")["comment"]
    }
  },
}
