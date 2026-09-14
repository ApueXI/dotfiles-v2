return {
  "nvim-mini/mini.pairs",
  event = "VeryLazy",
  opts = {
    modes = { insert = true, command = true, terminal = false },
    -- skip autopair when next character is one of these
    skip_next = [=[[%w%%%'%[%"%.%`%$]]=],
    -- skip autopair when the cursor is inside these treesitter nodes
    skip_ts = { "string" },
    -- skip autopair when next character is closing pair
    -- and there are more closing pairs than opening pairs
    skip_unbalanced = true,
    -- better deal with markdown code blocks
    markdown = true,

    -- Added Config for <>
    mappings = {
      ["<"] = { action = "open", pair = "<>", neigh_pattern = "[^\\]" },
      [">"] = { action = "close", pair = "<>", neigh_pattern = "[^\\]" },
    },
  },
  config = function(_, opts)
    LazyVim.mini.pairs(opts)
  end,
}

-- return {
--   "windwp/nvim-autopairs",
--   event = "InsertEnter",
--   opts = {
--     check_ts = true, -- enable treesitter integration
--     fast_wrap = {}, -- optional, for wrapping
--   },
--   config = function(_, opts)
--     local npairs = require("nvim-autopairs")
--     npairs.setup(opts)
--
--     local Rule = require("nvim-autopairs.rule")
--     local cond = require("nvim-autopairs.conds")
--
--     -- Auto-close < > for all filetypes
--     npairs.add_rules({
--       Rule("<", ">"),
--     })
--   end,
-- }
