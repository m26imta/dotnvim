local lspconfig = require('lspconfig')

local mason_ensured_installed = {
  "lua_ls",
  -- "sumneko_lua",
  "jsonls",
  "omnisharp",
  -- "mypy",
  -- "ruff",
  -- "black",
  -- "debugpy",
  "pyright",
}
require("mason").setup({})
require("mason-lspconfig").setup({
  ensure_installed = mason_ensured_installed,
  automatic_installed = true,
})

local installed_servers = require("mason-lspconfig").get_installed_servers()

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}
local diagnostic_config = {
  virtual_text = false, -- disable virtual text
  signs = {
    active = signs, -- show signs
  },
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = "minimal",
    border = "rounded",
    source = "always",
    header = "",
    prefix = "",
  },
}
vim.diagnostic.config(diagnostic_config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = "rounded" })
vim.lsp.handlers["textdocument/signaturehelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = "rounded" })

local function set_lsp_keymaps(_, bufnr)
  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below function
  local bufopts = { noremap = true, silent = true, buffer = bufnr }
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<c-space><c-k>', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, bufopts) -- jump to previous diagnostic in buffer
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, bufopts) -- jump to next diagnostic in buffer
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, bufopts) -- jump to next diagnostic in buffer

  -- Workspace
  vim.keymap.set('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<leader>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
end

local function set_keymaps(client, bufnr)
  local bufopts = { noremap = true, silent = true, buffer = bufnr }

  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  set_lsp_keymaps(client, bufnr)

  -- typescript specific keymaps (e.g. rename file and update imports)
  if client.name == "tsserver" then
    vim.keymap.set("n", "<leader>rf", ":TypescriptRenameFile<CR>")      -- rename file and update imports
    vim.keymap.set("n", "<leader>oi", ":TypescriptOrganizeImports<CR>") -- organize imports (not in youtube nvim video)
    vim.keymap.set("n", "<leader>ru", ":TypescriptRemoveUnused<CR>")    -- remove unused variables (not in youtube nvim video)
    vim.keymap.set('n', "<leader>am", ":TypescriptAddMissingImports<CR>")
  end

  vim.keymap.set('n', '<leader>td', '<cmd>Telescope lsp_document_symbols<cr>', bufopts)
end

local on_attach = function(client, bufnr)
  -- set_keymaps("lsp", client, bufnr)
  set_keymaps(client, bufnr)
  -- M.saga_set_keymaps(client, bufnr)

  if client.name == "omnisharp" then
    -- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- fix issue #2483 - omnisharp
    --  https://github.com/neovim/neovim/issues/21391
    --  https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
    local _ok, omnisharp_config = pcall(require, "plugins.configs.ide.langs.omnisharp")
    if _ok then omnisharp_config.fixIssue_2483(client, bufnr) end
  end
end

local get_capabilities = function()
  local capabilities = {}
  capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)
  return capabilities
end


-- use for loop to install all language lsp serviers
-- Tprint(installed_servers)
for _, lsp in ipairs(installed_servers) do
  local options = {
    on_attach = on_attach,
    capabilities = get_capabilities(),
    -- capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities()),
    flags = { debounce_text_changes = 150 },
  }

  -- load custom lsp_server_config
  local has_custom_lsp_config, lsp_server_config = pcall(require, "plugins.configs.ide.langs." .. lsp)
  if has_custom_lsp_config then
    options = vim.tbl_deep_extend("force", options, lsp_server_config)
  end

  -- Temporary fix lspconfig not go with latest cause lua_ls still is sumneko_lua
  if lsp == "lua_ls" then
    local exist_lua_ls, _ = pcall(require, "lspconfig.server_configurations.lua_ls")
    local still_sumneko, _ = pcall(require, "lspconfig.server_configurations.sumneko_lua")
    if not exist_lua_ls and still_sumneko then
      lsp = "sumneko_lua"
    end
  end

  lspconfig[lsp].setup(options)
  -- print(lsp)
end
