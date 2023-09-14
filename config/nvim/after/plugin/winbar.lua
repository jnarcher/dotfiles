require("winbar").setup({
    enabled = true,
    show_file_path = true,
    show_symbols = true,
    icons = {
        editor_state = '●'
    },

    exclude_filetype = {
        'help',
        'harpoon-menu',
    },
})
