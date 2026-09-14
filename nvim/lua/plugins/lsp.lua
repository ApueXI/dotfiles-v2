return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = { enabled = false },
    servers = {
      ast_grep = {},
      bashls = {},
      cssls = {},
      docker_compose_language_service = {},
      dockerls = {},
      emmet_language_server = {},
      graphql = {},
      fsautocomplete = {}, -- F# support
      lua_ls = {},
      pyright = {},
      roslyn = {}, -- C# support
      sqlls = {},
      terraformls = {},
      yamlls = {},
      dartls = {},
      tsserver = {
        enabled = false,
      },
      ts_ls = {
        enabled = false,
      },
      laravel_ls = {},
      html = { filetypes = { "php", "blade" } },
      intelephense = { filetypes = { "php", "blade" } },
      eslint = require("plugins.lsp-stuff.eslint"),
      jsonls = require("plugins.lsp-stuff.jsonls"),
      tailwindcss = require("plugins.lsp-stuff.tailwind"),
      ruff = require("plugins.lsp-stuff.ruff"),
      ruff_lsp = require("plugins.lsp-stuff.ruff_lsp"),
      vtsls = require("plugins.lsp-stuff.vtsls"),
      -- phpactor = {
      --   enabled = lsp == "phpactor",
      -- },
      -- intelephense = {
      --   enabled = lsp == "intelephense",
      -- },
      -- [lsp] = {
      --   enabled = true,
      -- },

      -- csharp_ls = {},
    },
    -- ts_ls = {},
    setup = require("plugins.lsp-stuff.setup"),
  },
}
