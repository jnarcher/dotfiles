vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.opt.nu = true

vim.o.completeopt = 'menuone,noselect'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.breakindent = true
vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
--vim.opt.undodir = os.getenv('$HOME')vim.expand('$HOME/.vim/undodir')
vim.undofile = true

--vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'

vim.opt.updatetime = 50

vim.opt.cursorline = true

vim.opt.cmdheight = 1
vim.opt.laststatus = 0

vim.opt.winbar = '%{expand("%:~:.")}%m%='

vim.opt.colorcolumn = '81'

-- Prevent auto formatting comments
vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
        vim.opt_local.formatoptions:remove({ 'c', 'r', 'o' })
    end
})
