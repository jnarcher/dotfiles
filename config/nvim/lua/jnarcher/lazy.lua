-- Install Package Manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({

    -- Fuzzy Finder (files, lsp, etc)
    {
        'nvim-telescope/telescope.nvim',
        branch = '0.1.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            {
                'nvim-telescope/telescope-fzf-native.nvim',
                build = 'make',
                cond = function()
                    return vim.fn.executable 'make' == 1
                end,
            },
        },
    },

    -- Color Schemes
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        lazy = false,
        prority = 1000,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
    },

    -- Highlight, edit, and navigate code
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = ':TSUpdate',
    },

    -- Better undo
    'mbbill/undotree',

    -- Adds git related signs to the gutter,
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            signs = {
                add = { text = '+' },
                change = { text = '~' },
                delete = { text = '_' },
                topdelete = { text = '‾' },
                changedelete = { text = '~' },
            },
        },
    },

    -- Easy commenting
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        main = "ibl",
    },

    -- Cleaner filetree
    {
        'stevearc/oil.nvim',
        lazy = false,
        dependencies = { 'nvim-tree/nvim-web-devicons' },
    },

    -- Nice todo comments
    {
        'folke/todo-comments.nvim',
        dependencies = { "nvim-lua/plenary.nvim" },
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    -- LSP Configuration & Plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            { 'williamboman/mason.nvim', config = true },
            'williamboman/mason-lspconfig.nvim',
        },
    },

    {
        -- Autocompletion
        'hrsh7th/nvim-cmp',
        dependencies = {
            -- Snippet Engine & its associated nvim-cmp source
            'L3MON4D3/LuaSnip',
            'saadparwaiz1/cmp_luasnip',

            -- Adds LSP completion capabilities
            'hrsh7th/cmp-nvim-lsp',

            -- Adds a number of user-friendly snippets
            'rafamadriz/friendly-snippets',
        },
    },

    -- GLSL syntax highlighting
    'tikhomirov/vim-glsl',

    -- Tmux to vim pane switching
    'christoomey/vim-tmux-navigator',

    {
        -- Pretty hover popup windows
        'Fildo7525/pretty_hover',
        event = "LspAttach",
        opts = {},
    },

    {
        'ray-x/lsp_signature.nvim',
        event = 'VeryLazy',
        opts = {
            hint_enable = false,
        },
        config = function(_, opts) require('lsp_signature').setup(opts) end
    },

    -- Nicer error UI
    {
        'folke/trouble.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        opts = {},
    },

    {
        'echasnovski/mini.notify',
        version = '*',
    },

    {
        'MeanderingProgrammer/render-markdown.nvim',
        opts = {},
    },

    { 'shortcuts/no-neck-pain.nvim', version = '*' },
});
