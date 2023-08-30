vim.keymap.set({ 'n', 'v' }, '<C-c>', '<Esc>')
vim.keymap.set('n', '<leader>tt', vim.cmd.Ex)

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

-- Copy selection to system clipboard
vim.keymap.set('n', '<leader>y', '"+y')
vim.keymap.set('v', '<leader>y', '"+y')

-- Delete to void register
vim.keymap.set('n', '<leader>d', '"_d')
vim.keymap.set('v', '<leader>d', '"_d')

vim.keymap.set('n', 'Q', '<nop>')

vim.keymap.set('n', '<leader>f', function() vim.lsp.buf.format() end)
