local M = {}

-- load omnisharp_extended_lsp
local _oel_ok, _ = pcall(require, "omnisharp_extended")
if _oel_ok then
  M = vim.tbl_deep_extend("force", M,
    {
      handlers = {
        ["textDocument/definition"] = require('omnisharp_extended').handler,
      }
    })
end

M = {

}

M.fixIssue_2483 = function(client, _)
  -- fix issue #2483 - omnisharp
  --  https://github.com/neovim/neovim/issues/21391
  --  https://github.com/OmniSharp/omnisharp-roslyn/issues/2483
  -- https://github.com/OmniSharp/omnisharp-roslyn/issues/2483#issuecomment-1364720374
  client.server_capabilities.semanticTokensProvider = {
    full = vim.empty_dict(),
    legend = {
      tokenModifiers = { "staticsymbol" },
      tokenTypes = {
        "comment",
        "excludedcode",
        "identifier",
        "keyword",
        "keywordcontrol",
        "number",
        "operator",
        "operatoroverloaded",
        "preprocessorkeyword",
        "string",
        "whitespace",
        "text",
        "staticsymbol",
        "preprocessortext",
        "punctuation",
        "stringverbatim",
        "stringescapecharacter",
        "classname",
        "delegatename",
        "enumname",
        "interfacename",
        "modulename",
        "structname",
        "typeparametername",
        "fieldname",
        "enummembername",
        "constantname",
        "localname",
        "parametername",
        "methodname",
        "extensionmethodname",
        "propertyname",
        "eventname",
        "namespacename",
        "labelname",
        "xmldoccommentattributename",
        "xmldoccommentattributequotes",
        "xmldoccommentattributevalue",
        "xmldoccommentcdatasection",
        "xmldoccommentcomment",
        "xmldoccommentdelimiter",
        "xmldoccommententityreference",
        "xmldoccommentname",
        "xmldoccommentprocessinginstruction",
        "xmldoccommenttext",
        "xmlliteralattributename",
        "xmlliteralattributequotes",
        "xmlliteralattributevalue",
        "xmlliteralcdatasection",
        "xmlliteralcomment",
        "xmlliteraldelimiter",
        "xmlliteralembeddedexpression",
        "xmlliteralentityreference",
        "xmlliteralname",
        "xmlliteralprocessinginstruction",
        "xmlliteraltext",
        "regexcomment",
        "regexcharacterclass",
        "regexanchor",
        "regexquantifier",
        "regexgrouping",
        "regexalternation",
        "regextext",
        "regexselfescapedcharacter",
        "regexotherescape",
      },
    },
    range = true,
  }
end

return M
