return {
  ["bbye"] = {
    { "<s-q>", "<cmd>Bdelete!<cr>", desc = "Close current buffer", mode = {"n"}, noremap = true, silent = true },
  },
  ["neotree"] = {
    { "<leader>fe", "<cmd>Neotree toggle<cr>", desc = "NeoTree", mode = {"n"} },
  },
  ["telescope"] = {
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
}
