-- list of files to hide in file tree
local hidden_files = {
    '.DS_Store',
    '.swp',
    '.git',
    'node_modules',
}

local oil = require('oil')

oil.setup({
    default_file_explorer = true,
    view_options = {
        show_hidden = true,
        is_always_hidden = function(name)
            for _, val in pairs(hidden_files) do
                if val == name then return true end
            end
            return false
        end,
    },
    win_options = {
        signcolumn = 'no',
    },
    keymaps = {
        ['g?'] = 'actions.show_help',
        ['<CR>'] = 'actions.select',
        ['-'] = 'actions.parent',
    },
    use_default_keymaps = false,
})

vim.keymap.set('n', '<leader>ot', oil.open)
