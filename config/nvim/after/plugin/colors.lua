
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

function Colorize(color)

    color = color or 'catppuccin'
    vim.cmd.colorscheme(color)

    -- vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
    -- vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLine', { bg = 'none' })
    vim.api.nvim_set_hl(0, 'CursorLineNR', { bold = true, italic = true })
end

Colorize()
