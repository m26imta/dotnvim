return {
  --
  -- bufferline
  {
    "akinsho/bufferline.nvim",
    version = "*",
    dependencies = {
      "nvim-tree/nvim-web-devicons",
      {
        "moll/vim-bbye",
        keys = require("plugins.configs.keymaps")["bbye"],
      },
    },
    event = "BufEnter",
    config = function()
      require("plugins.configs.bufferline")
    end,
  },
}
