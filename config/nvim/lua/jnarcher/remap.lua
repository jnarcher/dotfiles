local map = vim.keymap.set

-- Open file navigator (and enable line numbers)
map('n', '<leader>ot', ':Oil<CR>')

-- When moving blocks of code left or right keep selection
map('v', '>', '>gv')
map('v', '<', '<gv')

-- Keeps cursor in place during `J` cmd
map('n', 'J', 'mzJ`z')

-- Keeps cursor in middle of screen when cycling through search
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')

-- Keeps cursor in middle of screen when page up/down
map('n', '<C-u>', '<C-u>zz')
map('n', '<C-d>', '<C-d>zz')

-- Copy selection to system clipboard
map('n', '<leader>y', '"+y')
map('v', '<leader>y', '"+y')

-- Remove `Q` keybind
map('n', 'Q', vim.cmd.nop)

-- Window navigation
map({ 'n', 'i' }, '<C-h>', '<C-w><C-h>')
map({ 'n', 'i' }, '<C-j>', '<C-w><C-j>')
map({ 'n', 'i' }, '<C-k>', '<C-w><C-k>')
map({ 'n', 'i' }, '<C-l>', '<C-w><C-l>')

-- More readable naviagation
map('n', '{', '{zz')
map('n', '}', '}zz')

-- Jumping to beginning and end of row
map({ 'n', 'v' }, 'H', '^')
map({ 'n', 'v' }, 'L', '$')

-- Formatting
map({ 'n' }, '<leader>f', ':Format<CR>')

-- Unhighlights all search highlights
map({ 'n' }, '<Esc>', '<cmd>nohlsearch<CR>')
