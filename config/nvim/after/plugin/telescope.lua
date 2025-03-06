local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>sf', builtin.find_files, { desc = '[S]earch [F]iles' })
vim.keymap.set('n', '<leader>ss', builtin.live_grep, { desc = '[S]earch [S]ymbols' })
vim.keymap.set('n', '<leader>sh', builtin.help_tags, { desc = '[S]earch [H]elp'})
vim.keymap.set('n', '<C-p>', builtin.git_files, {}, { desc = 'Search Git files'})
vim.keymap.set('n', '<leader>sb', function ()
    require('telescope.builtin').current_buffer_fuzzy_find(require('telescope.themes').get_dropdown {
        previewer = false,
    })
end, { desc = 'Fuzzily search in current buffer' })
