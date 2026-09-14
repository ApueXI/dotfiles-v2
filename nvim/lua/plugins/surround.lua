-- return {
--   "kylechui/nvim-surround",
--   version = "^3.0.0", -- Use for stability
--   event = "VeryLazy",
--   config = function()
--     require("nvim-surround").setup({
--       -- Set keymaps so that visual mode S works like classic surround
--       keymaps = {
--         visual = "S", -- surround selection in visual mode
--         -- normal = "ys", -- add surrounding in normal mode
--         -- normal_line = "yS", -- add surrounding to a whole line
--         -- delete = "ds", -- delete surrounding
--         -- change = "cs", -- change surrounding
--       },
--     })
--   end,
-- }
--

return {
  "kylechui/nvim-surround",
  version = "^3.0.0",
  keys = {
    { "S", mode = "x" }, -- load when pressing S in visual mode
  },
  config = function()
    require("nvim-surround").setup({
      keymaps = {
        visual = "S",
      },
    })
  end,
}
