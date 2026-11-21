return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    highlight = {
      disable = {
        "html",
      },
    },
    ensure_installed = {
      "fsharp",
      "c_sharp",
      "ninja",
      "rst",
      "json5",
      "php",
      "blade",
      "dart",
    },
  },
}
