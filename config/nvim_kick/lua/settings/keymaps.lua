function Set_keymap(mode, lhs, rhs, desc)
  local opts = { noremap = true, silent = true, desc = desc or '' } -- Add description if provided
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- NOTE: My added keymaps
Set_keymap('n', '<C-r>', '<C-r>') -- i dont know why i have this but this si Redo
Set_keymap('n', '<Esc>', '<cmd>nohlsearch<CR>') -- Clear highlights on search when pressing <Esc> in normal mode
Set_keymap('i', '<C-BS>', '<C-w>') -- Removes a whole word before the cursor e.g. ctrl + backspace
Set_keymap('n', '<leader>e', function()
  if vim.bo.filetype == 'netrw' then
    vim.cmd 'bd'
  else
    vim.cmd 'Lex'
  end
end, 'Toggle file explorer')
Set_keymap('n', '<C-a>', 'ggVG', 'You have selected all words') -- Selects all words
Set_keymap('n', '<A-K>', '5k') -- Move x lines per up
Set_keymap('n', '<A-J>', '5j') -- Move x lines per down

-- Move line down/up in NORMAL mode
Set_keymap('n', '<A-j>', ':m .+1<CR>==')
Set_keymap('n', '<A-k>', ':m .-2<CR>==')

-- Move selected lines down/up in VISUAL mode
Set_keymap('v', '<A-j>', ":m '>+1<CR>gv=gv")
Set_keymap('v', '<A-k>', ":m '<-2<CR>gv=gv")

-- Visual mode indent/unindent with Tab / Shift+Tab
Set_keymap('v', '>', '>gv')
Set_keymap('v', '<', '<gv')

Set_keymap('n', '<C-t>', ':vsplit | terminal<CR>', 'Open termimal in split')

-- Diagnostic keymaps
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostic [Q]uickfix list' })
-- Exit terminal mode in the builtin terminal with a shortcut that is a bit easier
-- for people to discover. Otherwise, you normally need to press <C-\><C-n>, which
-- is not what someone will guess without a bit more experience.
--
-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set('t', '<Esc><Esc>', '<C-\\><C-n>', { desc = 'Exit terminal mode' })

-- NOTE: Navigating through different files in the top
vim.keymap.set('n', '<C-h>', '<C-w><C-h>', { desc = 'Move focus to the left window' })
vim.keymap.set('n', '<C-l>', '<C-w><C-l>', { desc = 'Move focus to the right window' })
vim.keymap.set('n', '<C-j>', '<C-w><C-j>', { desc = 'Move focus to the lower window' })
vim.keymap.set('n', '<C-k>', '<C-w><C-k>', { desc = 'Move focus to the upper window' })

-- NOTE: TIP: Disable arrow keys in normal mode, Enabled cuz i think it will force me to learn with hjkl``
vim.keymap.set('n', '<left>', '<cmd>echo "Use h to move!!"<CR>')
vim.keymap.set('n', '<right>', '<cmd>echo "Use l to move!!"<CR>')
vim.keymap.set('n', '<up>', '<cmd>echo "Use k to move!!"<CR>')
vim.keymap.set('n', '<down>', '<cmd>echo "Use j to move!!"<CR>')

-- :NOTE: Left over commnets from kickstart
-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
--  See `:help hlsearch`

-- Keybinds to make split navigation easier.
--  Use CTRL+<hjkl> to switch between windows
--
-- NOTE: Some terminals have colliding keymaps or are not able to send distinct keycodes
-- vim.keymap.set("n", "<C-S-h>", "<C-w>H", { desc = "Move window to the left" })
-- vim.keymap.set("n", "<C-S-l>", "<C-w>L", { desc = "Move window to the right" })
-- vim.keymap.set("n", "<C-S-j>", "<C-w>J", { desc = "Move window to the lower" })
-- vim.keymap.set("n", "<C-S-k>", "<C-w>K", { desc = "Move window to the upper" })
