return {
  recommended = function()
    return LazyVim.extras.wants({
      ft = { "cs", "vb", "fsharp" },
      root = { "*.sln", "*.csproj", "*.fsproj", "function.json", "paket.dependencies", "paket.lock" },
    })
  end,

  {
    "stevearc/conform.nvim",
    optional = true,
    opts = {
      formatters_by_ft = {
        -- cs = { "csharpier" },
        fsharp = { "fantomas" },
      },
    },
  },
  {
    "nvim-neotest/neotest",
    optional = true,
    dependencies = {
      "Nsidorenco/neotest-vstest",
    },
    opts = {
      adapters = {
        ["neotest-vstest"] = {
          -- Here we can set options for neotest-vstest
        },
      },
    },
  },
}
