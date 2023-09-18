require("oil").setup({
    default_file_explorer = true,
    columns = {
        "icon",
    },
    win_options = {
        wrap = false,
        signcolumn = "yes",
        foldcolumn = "0",
    },
    delete_to_trash = true,
    skip_confirm_for_simple_edits = true,
    trash_command = "trash",
    keymaps = {
        ["<C-p>"] = false, -- Conflicts with git telescope search
    },
    view_options = {
        show_hidden = true,
    }
})
