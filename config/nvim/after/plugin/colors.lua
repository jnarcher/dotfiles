require('catppuccin').setup({
    flavour = 'mocha',
    transparent_background = true,
    show_end_of_buffer = false,
})

require('rose-pine').setup({
    variant = 'moon',
    disable_background = true,
    disable_float_background = true,
})

function Colorize(color)
    color = color or 'catppuccin-mocha'
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#17181c' })
    vim.api.nvim_set_hl(0, 'CursorLineNR', { bold = true, italic = true })
end

Colorize()
