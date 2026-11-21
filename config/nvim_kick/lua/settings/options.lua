-- NOTE: [[ Setting options ]]
-- See `:help vim.o`
-- For more options, you can see `:help option-list`

-- NOTE: Some are from kickstart most are from chatgpt
-- Gonna modify Later

-- NOTE: Editing behavior
vim.o.breakindent = true -- enable break indent (wrapped lines keep inden )
vim.o.smartindent = true
vim.o.autoindent = true
vim.o.expandtab = true -- when tab is pressed, it will convert to space instead of \t
vim.o.shiftwidth = 2 -- sets each tab to two spaces
vim.o.tabstop = 2 -- Make it visually so each stab will look like 2 spaces
vim.o.backspace = 'indent,eol,start' -- controls how the Backspace key behaves while you're editing text

-- NOTE: Searching Options
-- Case-insensitive searching UNLESS \C or one or more capital letters in the search term
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true -- Highlight searched result
vim.o.incsearch = true --nvim will emmidiately highlight whatever you search

-- NOTE: UI/visuals
vim.o.number = true -- Make line numbers default
vim.o.relativenumber = false -- Removed numbers from moving and make it static
vim.o.cursorline = true -- Show which line your cursor is on
vim.o.showmatch = true -- Show matching bracket
vim.o.signcolumn = 'yes' -- Always show sign column (LSP, git signs)
vim.o.termguicolors = true -- Enable True colors

-- NOTE: Window split
vim.o.splitright = true
vim.o.splitbelow = true
vim.o.scrolloff = 8 -- Keep at least 8 lines when scrolling
vim.o.sidescrolloff = 8 -- Keep at least 8 lines when scrolling

-- NOTE: Performance & Responsiveness
vim.o.updatetime = 250 -- Decrease update time
vim.o.timeoutlen = 300 -- Decrease mapped sequence wait time
vim.o.lazyredraw = true -- reduces screen redraws during intensive operations to improve performance.

-- NOTE: Files & Undo
vim.o.undofile = true -- Save undo history Enable break indent
vim.o.autowrite = true -- Auto saves when switching buffers
vim.o.swapfile = false -- Disable swapfile (optional)
vim.o.backup = false -- Prevents creating a backup file, redundant if using version control e.g. git
vim.o.writebackup = false -- Prevents creating a backup file, redundant if using version control e.g. git
vim.o.hidden = true

-- NOTE: Miscellaneous options
vim.o.list = true -- display of invisible characters in the text, such as spaces, tabs, and newlines
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' } -- This sets custom symbols for displaying invisible characters when
vim.o.inccommand = 'split' -- Preview substitutions live, as you type!
vim.o.confirm = true -- This enables confirmation dialogs when performing actions that would fail due to unsaved changes

-- NOTE: QoL
vim.o.mouse = 'a' -- Enable mouse support
vim.o.completeopt = 'menuone,noselect' -- Better completion menu
vim.o.showmode = false -- Hide mode (statusline shows it instead)
vim.schedule(function()
  -- Sync clipboard between OS and Neovim.
  --  Schedule the setting after `UiEnter` because it can increase startup-time.
  --  Remove this option if you want your OS clipboard to remain independent.
  --  See `:help 'clipboard'`
  vim.o.clipboard = 'unnamedplus'
end)

-- NOTE: Show folder explorer on the left side
vim.g.netrw_banner = 0 -- Disables netrw banner
vim.g.netrw_liststyle = 3 -- How files are displayed in folder explorer, this is hierchial
vim.g.netrw_browse_split = 3 -- Controls how where new window is open in netrw, this is the right side
vim.g.netrw_winsize = -25

-- NOTE: Notes left behind by the lua.init
-- You can also add relative line numbers, to help with jumping.
-- Experiment for yourself to see if you like it!
-- vim.o.relativenumber = true
-- \n
-- Sets how neovim will display certain whitespace characters in the editor.
-- See `:help 'list'`
-- and `:help 'listchars'`
-- \n
-- Notice listchars is set using `vim.opt` instead of `vim.o`.
--  It is very similar to `vim.o` but offers an interface for conveniently interacting with tables.
--  See `:help lua-options`
--  and `:help lua-options-guide`
