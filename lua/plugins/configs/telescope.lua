return {
  ------------------------------
  -- Telescope
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.3",
    -- version = fasle, -- telescope did only one release, so use HEAD for now
    cmd = "Telescope",
    dependencies = {
      { "nvim-lua/plenary.nvim" },
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
    keys = {
      { "<leader>tll", "<cmd>Telescope<cr>", desc = "Open Telescope" },
      { "<leader>tlf", "<cmd>Telescope find_files<cr>", desc = "Telescope: Find Files" },
      { "<leader>tlg", "<cmd>Telescope live_grep<cr>", desc = "Telescope: Live Grep" },
      { "<leader>tgs", "<cmd>Telescope grep_string<cr>", desc = "Telescope: Grep String" },
      {
        "<leader>tps",
        function() require('telescope.builtin').grep_string({ search = vim.fn.input("Grep > ")  }); end,
        desc = "Telescope: Search string"
      },
    },
    config = function()
      require("plugins.configs.telescope")
    end,
  },
}
