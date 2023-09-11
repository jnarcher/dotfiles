--[[ remap.lua ]]

-- Moving selection up and down
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv")
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv")

-- Moving selection right and left
vim.keymap.set('v', '>', '>gv')
vim.keymap.set('v', '<', '<gv')

-- Keeps cursor in place during `J` cmd
vim.keymap.set('n', 'J', 'mzJ`z')

-- Keeps cursor in middle of screen when cycling through search
vim.keymap.set('n', 'n', 'nzzzv')
vim.keymap.set('n', 'N', 'Nzzzv')

-- Keeps cursor in middle of screen when page up/down
vim.keymap.set('n', '<C-u>', '<C-u>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')

-- Copy selection to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

-- Delete to void register
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

-- Remove `Q` keybind
vim.keymap.set('n', 'Q', '<nop>')
vim.keymap.set('n', 'q', '<nop>')

-- Format current buffer
-- vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)

-- Help with typos
vim.keymap.set('n', ':W<CR>', vim.cmd.w)
vim.keymap.set('n', ':Q<CR>', vim.cmd.q)
vim.keymap.set('n', ':Wq<CR>', vim.cmd.wq)
vim.keymap.set('n', ':WQ<CR>', vim.cmd.wq)

vim.keymap.set('n', '<C-q>', vim.cmd.q)
vim.keymap.set('n', '<C-w>', vim.cmd.w)

-- More readable naviagation
vim.keymap.set('n', '{', '{zz')
vim.keymap.set('n', '}', '}zz')

