-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.o.relativenumber = false
vim.o.number = true

-- NOTE: editing behavior
vim.o.breakindent = true -- enable break indent (wrapped lines keep inden )
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.expandtab = true -- when tab is pressed, it will convert to space instead of \t
vim.o.shiftwidth = 2 -- sets each tab to two spaces
vim.o.tabstop = 2 -- make it visually so each stab will look like 2 spaces
vim.o.backspace = "indent,eol,start" -- controls how the backspace key behaves while you're editing text

-- NOTE: searching options
-- case-insensitive searching unless \c or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true -- highlight searched result
vim.o.incsearch = true --nvim will emmidiately highlight whatever you search

-- NOTE: ui/visuals
vim.o.cursorline = true -- show which line your cursor is on
vim.o.showmatch = true -- show matching bracket
vim.o.signcolumn = "yes" -- always show sign column (lsp, git signs)
vim.o.termguicolors = true -- enable true colors
vim.o.number = true -- make line numbers default
vim.o.relativenumber = true -- removed numbers from moving and make it static

-- NOTE: window split
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 10 -- keep at least 8 lines when scrolling
vim.o.sidescrolloff = 10 -- keep at least 8 lines when scrolling

-- NOTE: performance & responsiveness
vim.o.updatetime = 250 -- decrease update time
vim.o.timeoutlen = 300 -- decrease mapped sequence wait time
vim.o.lazyredraw = false -- reduces screen redraws during intensive operations to improve performance.

-- NOTE: files & undo
vim.o.undofile = true -- save undo history enable break indent
vim.o.autowrite = true -- auto saves when switching buffers
vim.o.swapfile = false -- disable swapfile (optional)
vim.o.backup = false -- prevents creating a backup file, redundant if using version control e.g. git
vim.o.writebackup = false -- prevents creating a backup file, redundant if using version control e.g. git
vim.o.hidden = true

-- NOTE: miscellaneous options
vim.o.list = true -- display of invisible characters in the text, such as spaces, tabs, and newlines
vim.opt.listchars = { tab = "» ", trail = "·", nbsp = "␣" } -- this sets custom symbols for displaying invisible characters when
vim.o.inccommand = "split" -- preview substitutions live, as you type!
vim.o.confirm = true -- this enables confirmation dialogs when performing actions that would fail due to unsaved changes

-- NOTE: qol
vim.o.mouse = "a" -- enable mouse support
vim.o.completeopt = "menuone,noselect" -- better completion menu
vim.o.showmode = false -- hide mode (statusline shows it instead)
vim.schedule(function()
  -- sync clipboard between os and neovim.
  --  schedule the setting after `uienter` because it can increase startup-time.
  --  remove this option if you want your os clipboard to remain independent.
  --  see `:help 'clipboard'`
  vim.o.clipboard = "unnamedplus"
end)

-- NOTE: Show folder explorer on the left side

vim.g.netrw_banner = nil
vim.g.netrw_liststyle = nil
vim.g.netrw_browse_split = nil
vim.g.netrw_winsize = nil

vim.g.python3_host_prog = vim.fn.getcwd() .. "/.venv/bin/python"

vim.filetype.add({
  pattern = {
    [".*%.blade%.php"] = "blade",
  },
})
