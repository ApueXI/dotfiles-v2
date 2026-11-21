return {
  -- explicitly add default filetypes, so that we can extend
  -- them in related extras
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  settings = {
    complete_function_calls = true,
    vtsls = {
      enableMoveToFileCodeAction = true,
      autoUseWorkspaceTsdk = true,
      experimental = {
        maxInlayHintLength = 30,
        completion = {
          enableServerSideFuzzyMatch = true,
        },
      },
    },
    typescript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {},
      completeFunctionCalls = true,
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
    },
    javascript = {
      updateImportsOnFileMove = { enabled = "always" },
      suggest = {},
      completeFunctionCalls = true,
      inlayHints = {
        enumMemberValues = { enabled = true },
        functionLikeReturnTypes = { enabled = true },
        parameterNames = { enabled = "literals" },
        parameterTypes = { enabled = true },
        propertyDeclarationTypes = { enabled = true },
        variableTypes = { enabled = false },
      },
    },
  },
  keys = {
    {
      "gD",
      function()
        local win = vim.api.nvim_get_current_win()
        local params = vim.lsp.util.make_position_params(win, "utf-16")
        LazyVim.lsp.execute({
          command = "typescript.goToSourceDefinition",
          arguments = { params.textDocument.uri, params.position },
          open = true,
        })
      end,
      desc = "Goto Source Definition",
    },
    {
      "gR",
      function()
        LazyVim.lsp.execute({
          command = "typescript.findAllFileReferences",
          arguments = { vim.uri_from_bufnr(0) },
          open = true,
        })
      end,
      desc = "File References",
    },
    {
      "<leader>co",
      LazyVim.lsp.action["source.organizeImports"],
      desc = "Organize Imports",
    },
    {
      "<leader>cM",
      LazyVim.lsp.action["source.addMissingImports.ts"],
      desc = "Add missing imports",
    },
    {
      "<leader>cu",
      LazyVim.lsp.action["source.removeUnused.ts"],
      desc = "Remove unused imports",
    },
    {
      "<leader>cD",
      LazyVim.lsp.action["source.fixAll.ts"],
      desc = "Fix all diagnostics",
    },
    {
      "<leader>cV",
      function()
        LazyVim.lsp.execute({ command = "typescript.selectTypeScriptVersion" })
      end,
      desc = "Select TS workspace version",
    },
  },
}
-- return {
--   filetypes = {
--     "javascript",
--     "javascriptreact",
--     "javascript.jsx",
--     "typescript",
--     "typescriptreact",
--     "typescript.tsx",
--   },
--   settings = {
--     complete_function_calls = false,
--     vtsls = {
--       enableMoveToFileCodeAction = true,
--       autoUseWorkspaceTsdk = true,
--       experimental = {
--         maxInlayHintLength = 50,
--         completion = {
--           -- Disabled
--           enableServerSideFuzzyMatch = false,
--         },
--       },
--     },
--
--     typescript = {
--       updateImportsOnFileMove = { enabled = "always" },
--       suggest = {
--         completeFunctionCalls = true,
--       },
--       inlayHints = {
--         enumMemberValues = { enabled = true },
--         parameterNames = { enabled = "literals" },
--
--         -- Disabled
--         functionLikeReturnTypes = { enabled = false },
--         parameterTypes = { enabled = false },
--         propertyDeclarationTypes = { enabled = false },
--         variableTypes = { enabled = false },
--       },
--       format = { enable = false },
--     },
--     javascript = {
--       updateImportsOnFileMove = { enabled = "always" },
--       suggest = {
--         completeFunctionCalls = true,
--       },
--       inlayHints = {
--         enumMemberValues = { enabled = true },
--         parameterNames = { enabled = "literals" },
--
--         -- Disabled
--         functionLikeReturnTypes = { enabled = false },
--         parameterTypes = { enabled = false },
--         propertyDeclarationTypes = { enabled = false },
--         variableTypes = { enabled = false },
--       },
--       format = { enable = false },
--     },
--   },
--   flags = {
--     debounce_text_changes = 200, -- wait 200ms after typing
--   },
-- }
--
-- "typescript.inlayHints.parameterTypes.enabled": {
--   "type": "boolean",
--   "default": false,
--   "markdownDescription": {
--     "message": "Enable/disable inlay hints for implicit parameter types:\n```typescript\n\nel.addEventListener('click', e /* :MouseEvent */ => ...)\n \n```",
--     "comment": [
--       "The text inside the ``` block is code and should not be localized."
--     ]
--   }
-- },
