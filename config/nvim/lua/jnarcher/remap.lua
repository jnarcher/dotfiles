local map = vim.keymap.set

-- Arrow keys suck
map({"n", "i", "v"}, "<up>", "<nop>")
map({"n", "i", "v"}, "<down>", "<nop>")
map({"n", "i", "v"}, "<left>", "<nop>")
map({"n", "i", "v"}, "<right>", "<nop>")

-- Quicker Escape from insert mode
map("i", "jk", "<Esc>l")
map("i", "kj", "<Esc>")

-- Open File Navigator (and enable line numbers)
map("n", "<leader>ot", ":Oil<CR>")

-- Moving selection up and down
-- These are buggy 
-- map('v', 'J', ":m '>+1<CR>gv=gv")
-- map('v', 'K', ":m '<-2<CR>gv=gv")

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

-- Format current buffer
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)

map('n', '<leader>w', vim.cmd.w)
map('n', '<leader>q', vim.cmd.q)
map('n', '<leader>z', vim.cmd.wq)
map('i', '<C-s>', '<Esc>:w<CR>a')

-- window navigation
map({'n', 'i'}, '<C-h>', '<C-w><C-h>')
map({'n', 'i'}, '<C-j>', '<C-w><C-j>')
map({'n', 'i'}, '<C-k>', '<C-w><C-k>')
map({'n', 'i'}, '<C-l>', '<C-w><C-l>')

-- More readable naviagation
map('n', '{', '{zz')
map('n', '}', '}zz')

-- jumping to beginning and end of row
map({'n', 'v'}, 'H', '^')
map({'n', 'v'}, 'L', '$')

-- Get hints for under cursor
map('n', 'K', vim.lsp.buf.hover)

-- Select everything
map('n', '<C-a>', 'G$vgg0')
