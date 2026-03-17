-- Options
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

vim.o.number = true
vim.o.relativenumber = true

vim.o.shiftwidth = 4
vim.o.tabstop = 4
vim.o.softtabstop = 4
vim.o.expandtab = true
vim.o.autoindent = true
vim.o.smartindent = true

vim.o.wrap = false 
vim.o.linebreak = true 
vim.o.hlsearch = true

vim.o.encoding = 'utf-8'
vim.o.mouse = 'a'
vim.o.clipboard = 'unnamedplus'
vim.o.swapfile = false
vim.o.termguicolors = true
vim.g.have_nerd_font = true

vim.o.showmode = false
vim.o.signcolumn = 'yes'
vim.o.cursorline = true

vim.api.nvim_create_autocmd('TextYankPost', {
    desc = 'Highlight when yanking (copying) text',
    group = vim.api.nvim_create_augroup('kickstart-highlight-yank', { clear = true }),
    callback = function() vim.hl.on_yank() end,
})

vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

-- Bootstrap lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

-- Plugins
require("lazy").setup({
    {
        "nvim-neo-tree/neo-tree.nvim",
        branch = "v3.x",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "MunifTanjim/nui.nvim",
            "nvim-tree/nvim-web-devicons"
        },
        lazy = false
    },
    { 
        "catppuccin/nvim", 
        name = "catppuccin", 
        priority = 1000,
        config = function()
            require('catppuccin').setup {
                flavour = 'mocha',
                transparent_background = true,
                auto_integrations = true,
                styles = {
                    comments = {'italic'},
                    functions = {'italic'},
                    conditionals = {}
                }
            }
            vim.cmd.colorscheme 'catppuccin-mocha'
        end,
    },
    {
        'nvim-lualine/lualine.nvim',
        dependencies = { 'nvim-tree/nvim-web-devicons' },
        config = function()
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'catppuccin-mocha',
                    component_separators = "",
                    section_separators = { left = "", right = "" }

                    -- sections = {
                    --     lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
                    --     lualine_y = {
                    --         { "progress", separator = " ", padding = { left = 1, right = 0 } },
                    --         { "location", padding = { left = 0, right = 1 } },
                    --     },
                    --     lualine_z = {
                    --         {
                    --             function()
                    --                 return " " .. os.date("%R")
                    --             end,
                    --             separator = { right = "" },
                    --         },
                    --     },
                    -- },

                }
            }
        end,
    },
    {
        'nvim-treesitter/nvim-treesitter',
        config = function()
            local filetypes = { 'bash', 'c', 'cpp', 'cmake', 'doxygen', 'fortran', 'diff', 'html', 'json', 'kitty', 'lua', 'luadoc', 'toml', 'vim', 'vimdoc', 'yaml' }
            require('nvim-treesitter').install(filetypes)
            vim.api.nvim_create_autocmd('FileType', {
                pattern = filetypes,
                callback = function() vim.treesitter.start() end,
            })
        end,
    },
})


