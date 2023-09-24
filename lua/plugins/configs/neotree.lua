-- Disable netrw
vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

local options = {
  window = {
    width = 30,
    mappings = {
      ['h'] = "close_node",
      ['l'] = "open",
    },
  },
}

require("neo-tree").setup(options)
