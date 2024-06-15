
require('github-theme').setup({
    options = {
        hide_end_of_buffer = true,
        transparent = true,
    },
})

require('tokyonight').setup({
    style = 'storm',
    transparent = true,
    hide_inactive_statusline = true,
})

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

require('kanagawa').setup({
    transparent = true,
})

function Colorize(color)
    color = color or 'rose-pine'
    vim.cmd.colorscheme(color)
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'ColorColumn', { bg = '#17181c' })
    vim.api.nvim_set_hl(0, 'CursorLineNR', { bold = true, italic = true })
end
Colorize()
