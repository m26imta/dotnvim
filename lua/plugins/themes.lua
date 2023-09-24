local theme = "rose-pine"

local builtin_themes = {"blue", "darkblue", "default", "delek", "desert", "elflord",
  "evening", "habamax", "industry", "koehler", "lunaperche", "morning", "murphy",
  "pablo", "peachpuff", "quiet", "ron", "shine", "slate", "torte", "zellner"}
local preinstall = false    -- true: install all themes / false: install only 1 theme
local islazy = true

local default_theme_opts = {
  lazy = islazy,
}

local themes = {
  { "rose-pine/neovim",               name = "rose-pine",     colorscheme = "rose-pine-moon", opts = { disable_italics = true, } },
  { "joshdick/onedark.vim",           name = "onedark",       colorscheme = "onedark" },
  { "lunarvim/darkplus.nvim",         name = "darkplus",      colorscheme = "darkplus" },
  { "bluz71/vim-nightfly-guicolors",  name = "nightfly",      colorscheme = "nightfly" },
  { "catppuccin/nvim",                name = "catppuccin",    colorscheme = "catppuccin" },
  { "sainnhe/everforest",             name = "everforest",    colorscheme = "everforest" },
  { "projekt0n/github-nvim-theme",    name = "github-theme",  colorscheme = "github_dark" },
  { "folke/tokyonight.nvim",          name = "tokyonight",    colorscheme = "tokyonight-night" },
  { "morhetz/gruvbox",                name = "gruvbox",       colorscheme = "gruvbox" },
  { "sainnhe/gruvbox-material",       name = "gruvboxm",      colorscheme = "gruvbox-material" },
}

local function set_theme()
  for _, v in pairs(builtin_themes) do
    if v == theme then
      vim.cmd("colorscheme " .. theme)
      return {}
    end
  end

  local M = {}
  for _, v in ipairs(themes) do
    v = vim.tbl_deep_extend("force", v, default_theme_opts)   -- set default color opts for every colorscheme
    if v.name == theme then
      v.init = function()
        vim.cmd("colorscheme " .. v.colorscheme)
        -- if v.opts then require(v.name).setup(v.opts or {}) end
      end
      v.lazy = false    -- make sure we load this during startup if it is your main colorscheme
      v.priority = 1000 -- make sure to load this before all the other start plugins
    end
    if preinstall then
      table.insert(M, v)
    elseif v.name == theme then
      table.insert(M, v)
    end
  end
  return M
end

return set_theme()
