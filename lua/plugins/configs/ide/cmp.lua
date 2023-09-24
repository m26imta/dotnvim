local cmp = require("cmp")
local luasnip = require("luasnip")
local lspkind = require("lspkind")

local check_backspace = function()
  local col = vim.fn.col "." - 1
  return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
end


-- local kind_icons = lspkind.cmp_format()
--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = "",
  Method = "",
  Function = "",
  Constructor = "",
  Field = "ﰠ",
  Variable = "",
  Class = "ﴯ",
  Interface = "",
  Module = "",
  Property = "ﰠ",
  Unit = "",
  Value = "",
  Enum = "",
  Keyword = "",
  Snippet = "",
  Color = "",
  File = "",
  Reference = "",
  Folder = "",
  EnumMember = "",
  Constant = "",
  Struct = "פּ",
  Event = "",
  Operator = "",
  TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet
--


-- nvchad style
local cmp_ui = {
  icons = true,
  lspkind_text = true,
  style = "default", -- default/flat_light/flat_dark/atom/atom_colored
  border_color = "grey_fg", -- only applicable for "default" style, use color names from base30 variables
  selected_item_bg = "colored", -- colored / simple
}
local cmp_style = cmp_ui.style
local field_arrangement = {
  atom = { "kind", "abbr", "menu" },
  atom_colored = { "kind", "abbr", "menu" },
}
local nvchad_formatting_style = {
  -- default fields order i.e completion word + item.kind + item.kind icons
  fields = field_arrangement[cmp_style] or { "abbr", "kind", "menu" },

  format = function(_, item)
    -- local icons = require "nvchad.icons.lspkind"
    local icons = require("lspkind")
    local icon = (cmp_ui.icons and icons[item.kind]) or ""

    if cmp_style == "atom" or cmp_style == "atom_colored" then
      icon = " " .. icon .. " "
      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
      item.kind = icon
    else
      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
    end

    return item
  end,
}
local nvchadmapping = {
  ["<C-p>"] = cmp.mapping.select_prev_item(),
  ["<C-n>"] = cmp.mapping.select_next_item(),
  ["<C-d>"] = cmp.mapping.scroll_docs(-4),
  ["<C-f>"] = cmp.mapping.scroll_docs(4),
  ["<C-Space>"] = cmp.mapping.complete(),
  ["<C-e>"] = cmp.mapping.close(),
  ["<CR>"] = cmp.mapping.confirm {
    behavior = cmp.ConfirmBehavior.Insert,
    select = true,
  },
  ["<Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expand_or_jumpable() then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
    else
      fallback()
    end
  end, {
      "i",
      "s",
    }),
  ["<S-Tab>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
    else
      fallback()
    end
  end, {
      "i",
      "s",
    }),
}


local mymapping = {
  -- ["<C-j>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
  -- ["<C-k>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
  -- ["<C-n>"] = cmp.mapping(cmp.mapping.select_next_item(), { "i", "c" }),
  -- ["<C-p>"] = cmp.mapping(cmp.mapping.select_prev_item(), { "i", "c" }),
  ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-1), { "i", "c" }),
  ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(1), { "i", "c" }),
  ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
  ["<C-y>"] = cmp.config.disable, -- Specify `cmp.config.disable` if you want to remove the default `<C-y>` mapping.
  ["<C-e>"] = cmp.mapping {
    i = cmp.mapping.abort(),
    c = cmp.mapping.close(),
  },
  -- Accept currently selected item. If none selected, `select` first item.
  -- Set `select` to `false` to only confirm explicitly selected items.
  ["<CR>"] = cmp.mapping.confirm { select = false },
  ["<c-n>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_next_item()
    elseif luasnip.expandable() then
      luasnip.expand()
    elseif luasnip.expand_or_jumpable() then
      luasnip.expand_or_jump()
    elseif check_backspace() then
      fallback()
    else
      fallback()
    end
  end, { "i", "s", }),
  ["<c-p>"] = cmp.mapping(function(fallback)
    if cmp.visible() then
      cmp.select_prev_item()
    elseif luasnip.jumpable(-1) then
      luasnip.jump(-1)
    else
      fallback()
    end
  end, { "i", "s", }),
}

local myformatting = {
  fields = { 'abbr', 'kind', 'menu', },
  -- https://github.com/onsails/lspkind.nvim#option-2-nvim-cmp
  format = lspkind.cmp_format {
    mode = "text_symbol", -- show only symbol annotations
    maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
    ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
    -- The function below will be called before any actual modifications from lspkind
    -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
    before = function(entry, vim_item)
      local shorten_abbr = string.sub(vim_item.abbr, 1, 30)
      if shorten_abbr ~= vim_item.abbr then vim_item.abbr = shorten_abbr .. "..." end
      -- Kind icons  |  Text -->  Text
      vim_item.kind = string.format("%s %s", kind_icons[vim_item.kind], vim_item.kind)
      -- Source
      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[API]",
        luasnip = "[LuaSnip]",
        buffer = "[Buffer]",
        path = "[Path]",
        nvim_lsp_signature_help = "[_help]",
        -- cmdline = "[cmdline]",
        -- calc = "[calc]",
        -- latex_symbols = "[LaTeX]",
        -- cmp_tabnine = "[Tabnine]",
        -- emoji = "[Emoji]",
      })[entry.source.name]
      return vim_item
    end,
  },
}

local options = {
  completion = {
    --completeopt = 'menu,menuone,noinsert'
    completeopt = "menu,menuone,noselect"
  },
  snippet = {
    -- `luasnip` config
    expand = function(args)
      luasnip.lsp_expand(args.body)
    end
  },
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  sources = cmp.config.sources({
    { name = "nvim_lsp" },
    { name = "nvim_lua" },
    { name = "path" },
    { name = "buffer" },
    -- { name = "cmdline" },
    { name = "nvim_lsp_signature_help" },
    -- { name = "calc" },
    -- { name = "rg" },
    {
      name = "luasnip",
      option = {} or {
        -- https://github.com/saadparwaiz1/cmp_luasnip#cmp_luasnip
        { use_show_condition = false }, -- to disable filtering completion candidates by snippet's show_condition
        { show_autosnippets = true },
      },
    },
  }),
  mapping = nvchadmapping,
  formatting = myformatting,
}


-- Setup
cmp.setup(options)


-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
  }, {
      { name = 'buffer' },
    })
})

-- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
      { name = 'cmdline' }
    })
})
