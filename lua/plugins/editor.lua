return {
  --
  -- NeoTree
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    lazy = true,
    cmd = "Neotree",
    keys = require("plugins.configs.keymaps")["neotree"],
    config = function()
      require("plugins.configs.neotree")
    end,
  },
  --
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    -- version = fasle, -- telescope did only one release, so use HEAD for now
    cmd = "Telescope",
    keys = require("plugins.configs.keymaps")["telescope"],
    dependencies = {
      {
        "nvim-telescope/telescope-ui-select.nvim",
        enabled = false,
        config = function()
          require("telescope").load_extension("ui-select")
        end,
      },
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
        enabled = false,
        config = function()
          require("telescope").load_extension("fzf")
        end,
      },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },
  --
  -- dependencies
  {
    {"nvim-lua/plenary.nvim", lazy = true},
    {"nvim-tree/nvim-web-devicons", lazy = true},
    {"MunifTanjim/nui.nvim", lazy = true},
  }
}
