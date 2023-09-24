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
  --
  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    --event = "BufEnter", lazy = true,
    event = "VeryLazy",
    config = function()
      require("plugins.configs.lualine")
    end,
  },
  --
  -- noice
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    dependencies = {
      -- if you lazy-load any plugin below, make sure to add proper `module="..."` entries
      "MunifTanjim/nui.nvim",
      -- OPTIONAL:
      --   `nvim-notify` is only needed, if you want to use the notification view.
      --   If not available, we use `mini` as the fallback
      "rcarriga/nvim-notify",
    },
    config = function ()
      require("plugins.configs.noice")
    end
  },
  --
  -- dependencies
  {
    {"nvim-lua/plenary.nvim", lazy = true},
    {"nvim-tree/nvim-web-devicons", lazy = true},
    {"MunifTanjim/nui.nvim", lazy = true},
  }
}
