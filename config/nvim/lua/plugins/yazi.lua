---@type LazySpec
return {
  "mikavilpas/yazi.nvim",
  version = "*", -- use the latest stable version
  event = "VeryLazy",
  dependencies = {
    { "nvim-lua/plenary.nvim", lazy = true },
  },
  keys = {
    -- 👇 in this section, choose your own keymappings!
    {
      "<leader>-",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>cw",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  ---@type YaziConfig | {}
  opts = {
    -- if you want to open yazi instead of netrw, see below for more info
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
    -- auto_set_cwd = true,

    open_file_function = function(chosen_path, config, state)
      local is_dir = vim.fn.isdirectory(chosen_path) == 1

      if not vim.g.yazi_from_dashboard then
        return
      end

      if is_dir then
        -- if it’s a directory, cd into it directly
        vim.cmd("cd " .. chosen_path)
        vim.cmd("edit " .. chosen_path)
      else
        -- if it’s a file, cd to its folder
        vim.cmd("cd " .. vim.fn.fnamemodify(chosen_path, ":h"))
        -- open the file
        vim.cmd("edit " .. chosen_path)
      end
    end,
  },
  -- 👇 if you use `open_for_directories=true`, this is recommended
  init = function()
    -- mark netrw as loaded so it's not loaded at all.
    --
    -- More details: https://github.com/mikavilpas/yazi.nvim/issues/802
    vim.g.loaded_netrwPlugin = 1
  end,
}
