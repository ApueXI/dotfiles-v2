-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

vim.lsp.set_log_level("off")

vim.filetype.add({
  extension = {
    http = "http",
  },
})

vim.api.nvim_create_autocmd("FileType", {
  pattern = "json",
  callback = function(ev)
    vim.bo[ev.buf].formatprg = "jq"
    vim.bo[ev.buf].formatexpr = ""
  end,
})

vim.api.nvim_create_autocmd("BufWritePost", {
  pattern = "*",
  callback = function()
    pcall(vim.cmd, "ReferencerUpdate")
  end,
})
