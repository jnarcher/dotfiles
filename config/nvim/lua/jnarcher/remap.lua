local map = vim.keymap.set

-- Easier to enter command mode
map({'n', 'v'}, ';', ':')

-- Folding
map('n', '<leader><leader>', 'zc')

-- Arrow keys suck
map({'n', 'i', 'v'}, '<up>', '<nop>')
map({'n', 'i', 'v'}, '<down>', '<nop>')
map({'n', 'i', 'v'}, '<left>', '<nop>')
map({'n', 'i', 'v'}, '<right>', '<nop>')

-- Quicker escape from insert and command mode
map({'i', 'c'}, 'jk', '<Esc>')

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

map('n', '<leader>w', vim.cmd.w)
map('n', '<leader>q', vim.cmd.q)
map('n', '<leader>z', vim.cmd.wq)
map('i', '<C-s>', '<Esc>:w<CR>a')

-- Window navigation
map({'n', 'i'}, '<C-h>', '<C-w><C-h>')
map({'n', 'i'}, '<C-j>', '<C-w><C-j>')
map({'n', 'i'}, '<C-k>', '<C-w><C-k>')
map({'n', 'i'}, '<C-l>', '<C-w><C-l>')

-- More readable naviagation
map('n', '{', '{zz')
map('n', '}', '}zz')

-- Jumping to beginning and end of row
map({'n', 'v'}, 'H', '^')
map({'n', 'v'}, 'L', '$')

-- Get hints for under cursor
map('n', 'K', vim.lsp.buf.hover)
