
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

    vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'SignColumn', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'GitSignsAdd', {
        fg = '#557cc3',
        bg = 'none',
    })
    vim.api.nvim_set_hl(0, 'GitSignsChange', {
        fg = '#e5bf03',
        bg = 'none'
    })
    vim.api.nvim_set_hl(0, 'GitSignsDelete', {
        fg = '#de5b5b',
        bg = 'none',
    })
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNR', {
        fg = '#ffd75f',
        bold = true,
        italic = true,
    })
    vim.api.nvim_set_hl(0, 'LineNR', { fg = '#5f5f5f', bg = 'none' })
    vim.api.nvim_set_hl(0, 'IndentBlankLineChar', { fg = '#333333' })
end
Colorize()
