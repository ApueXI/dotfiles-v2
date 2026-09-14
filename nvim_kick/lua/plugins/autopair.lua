return {
  'windwp/nvim-autopairs',
  event = 'InsertEnter',
  opts = {
    check_ts = true, -- enable treesitter integration
    fast_wrap = {}, -- optional, for wrapping
  },
  config = function(_, opts)
    local npairs = require 'nvim-autopairs'
    npairs.setup(opts)

    local Rule = require 'nvim-autopairs.rule'
    local cond = require 'nvim-autopairs.conds'

    -- Auto-close < > for all filetypes
    npairs.add_rules {
      Rule('<', '>'),
    }
  end,
}
