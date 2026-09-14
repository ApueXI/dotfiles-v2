return {
  {
    "mason-org/mason.nvim",
    opts = {
      registries = {
        -- Need this for roslyn
        "github:mason-org/mason-registry",
        "github:Crashdummyy/mason-registry",
      },
      ensure_installed = {
        "jq",
        "fantomas",
        "prettierd",
        "shfmt",
        "stylua",
        "netcoredbg",
        "stylelint",
        "roslyn",
        "phpcs",
        "php-cs-fixer",
        -- "csharpier",
      },
    },
  },
}

-- Installed
--   ◍ ast-grep ast_grep
--   ◍ bash-language-server bashls
--   ◍ css-lsp cssls
--   ◍ docker-compose-language-service docker_compose_language_service
--   ◍ dockerfile-language-server dockerls
--   ◍ emmet-language-server emmet_language_server
--   ◍ eslint-lsp eslint
--   ◍ fantomas
--   ◍ fsautocomplete
--   ◍ graphql-language-service-cli graphql
--   ◍ html-lsp html
--   ◍ jq
--   ◍ json-lsp jsonls
--   ◍ lua-language-server lua_ls
--   ◍ netcoredbg
--   ◍ prettierd
--   ◍ pyright
--   ◍ roslyn
--   ◍ ruff
--   ◍ shfmt
--   ◍ sqlls
--   ◍ stylelint
--   ◍ stylua
--   ◍ tailwindcss-language-server tailwindcss
--   ◍ terraform-ls terraformls
--   ◍ vtsls
--   ◍ yaml-language-server yamlls
