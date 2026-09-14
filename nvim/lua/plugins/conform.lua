return {
  "stevearc/conform.nvim",
  optional = true,
  opts = {
    formatters_by_ft = {
      -- cs = { "csharpier" },
      fsharp = { "fantomas" },
      javascript = { "prettierd" },
      javascriptreact = { "prettierd" },
      typescript = { "prettierd" },
      typescriptreact = { "prettierd" },
      json = { "prettierd" },
      jsonc = { "prettierd" },
      css = { "prettierd" },
      scss = { "prettierd" },
      html = { "prettierd" },
      markdown = { "prettierd" },
      yaml = { "prettierd" },
      dart = { "dart_format" },
    },
  },
}
