return {
  "rest-nvim/rest.nvim",
  ft = "http",
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      opts.ensure_installed = opts.ensure_installed or {}
      table.insert(opts.ensure_installed, "http")
    end,
  },
  ---@class rest.Config.Response
  response = {
    ---Default response hooks
    ---@class rest.Config.Response.Hooks
    hooks = {
      ---@type boolean Decode the request URL segments on response UI to improve readability
      decode_url = true,
      --@type boolean Format the response body using `gq` command
      format = true,
    },
  },
}
