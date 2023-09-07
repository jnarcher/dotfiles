--[[ lazy.lua ]]

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

    -- Color Scheme
    {
        'projekt0n/github-nvim-theme',
        lazy = false,
        priority = 1000,
        config = function()
            require('github-theme').setup({})
            vim.cmd('colorscheme github_dark_tritanopia')
        end,
    },

    -- Highlight, edit, and navigate code
    {
        'nvim-treesitter/nvim-treesitter',
        dependencies = { 'nvim-treesitter/nvim-treesitter-textobjects' },
        build = ':TSUpdate',
    },

    -- Quick file jumping
    'ThePrimeagen/harpoon',

    -- Better undo
    'mbbill/undotree',

    -- Git tools
    'tpope/vim-fugitive',
    'tpope/vim-rhubarb',

    -- Easy commenting
    -- Adds git related signs to the gutter, 
    -- as well as utilities for managing changes
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

    -- TODO: redo this lsp/complete section

    -- LSP Configuration & Plugins
    {
        'neovim/nvim-lspconfig',
        dependencies = {
            -- Automatically install LSPs to stdpath for neovim
            {
                'williamboman/mason.nvim',
                config = true,
            },
            'williamboman/mason-lspconfig.nvim',

            -- Additional lua configuration, makes nvim stuff amazing!
            'folke/neodev.nvim',
        },
    },

    -- Autocompletion
    {
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

    -- Easy commenting
    {
        'numToStr/Comment.nvim',
        lazy = false,
    },

    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',

    -- Auto pairing characters
    {
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
    },

    -- Cool File tree
    {
        'stevearc/oil.nvim',
        dependencies = {
            'nvim-tree/nvim-web-devicons'
        },
    },

    -- Gui-like input fields
    'stevearc/dressing.nvim',
});
