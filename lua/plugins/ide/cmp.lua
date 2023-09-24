return {
  --
  -- Autocompletion
  {
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- cmp sources
      {'hrsh7th/cmp-nvim-lsp' },                    -- Required - nvim-cmp source for neovim's built-in language server client. 
      {'hrsh7th/cmp-nvim-lua'},                     -- nvim-cmp source for neovim Lua API. 
      {'hrsh7th/cmp-path' },                        -- nvim-cmp source for filesystem paths. 
      {'hrsh7th/cmp-buffer' },                      -- nvim-cmp source for buffer words. 
      {'hrsh7th/cmp-cmdline' },                     -- nvim-cmp source for vim's cmdline.
      {'hrsh7th/cmp-nvim-lsp-signature-help' },     -- nvim-cmp source for displaying function signatures with the current parameter emphasized
      {'hrsh7th/cmp-calc' },                        -- nvim-cmp source for math calculation.
      {'lukas-reineke/cmp-rg'},                     -- ripgrep source for nvim-cmp

      -- Snippet
      {'L3MON4D3/LuaSnip'},                         -- Required - snippet engine
      {'saadparwaiz1/cmp_luasnip' },                -- luasnip completion source for nvim-cmp
      {'rafamadriz/friendly-snippets'},

      -- lsp_kind
      {'onsails/lspkind.nvim'},
    },
    event = "InsertEnter",
    config = function()
      require("plugins.configs.ide.cmp")
    end,
  },
}
