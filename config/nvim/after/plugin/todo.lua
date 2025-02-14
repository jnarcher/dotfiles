require('todo-comments').setup({
    gui_style = {
        fg = "BOLD",
    },
    highlight = {
        keyword = "fg",
        after = "",
        pattern = [[(KEYWORDS)]],
    },
})
