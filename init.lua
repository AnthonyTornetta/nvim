require("cornchip")

--[[ 
-- Keybinds I always forget:
--
-- Comment Line(s)
--   - gcc - comment line
--   - gc[direction number] - comment that amount of lines
--   - gcA - add comment to end of line
-- 
--]]

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

local plugins = {
	{
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		dependencies = { 'nvim-lua/plenary.nvim' }
	},
	{ {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"} },
    {'neovim/nvim-lspconfig'},
    {'hrsh7th/cmp-buffer'},
    {'hrsh7th/cmp-path'},
    --{'VonHeikemen/lsp-zero.nvim', branch = 'v3.x'},
	--{'neovim/nvim-lspconfig'},
	{'hrsh7th/cmp-nvim-lsp'},
	{'hrsh7th/nvim-cmp'},
    {'saadparwaiz1/cmp_luasnip'},
    {'rafamadriz/friendly-snippets'},
    {'L3MON4D3/LuaSnip'},
	{'williamboman/mason.nvim'},
	{'williamboman/mason-lspconfig.nvim'},
    {'neovim/nvim-lspconfig'},
    {
        "folke/tokyonight.nvim",
        lazy = false,
        priority = 1000,
        opts = {},
    },
    {
        "kdheepak/lazygit.nvim",
        cmd = {
            "LazyGit",
            "LazyGitConfig",
            "LazyGitCurrentFile",
            "LazyGitFilter",
            "LazyGitFilterCurrentFile",
        },
        -- optional for floating window border decoration
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
    },
    --{ "tamton-aquib/mpv.nvim", config=true },
    {
        "mrcjkb/rustaceanvim",
        version = "^3",
        dependencies = {
            "nvim-lua/plenary.nvim",
            "mfussenegger/nvim-dap",
            {
                "lvimuser/lsp-inlayhints.nvim",
                opts = {}
            },
        },
        ft = { "rust" },
        config = function()
            vim.g.rustaceanvim = {
                inlay_hints = {
                    highlight = "NonText",
                },
                tools = {
                    hover_actions = {
                        auto_focus = true,
                    },
                },
                server = {
                    on_attach = function(client, bufnr)
                        require("lsp-inlayhints").on_attach(client, bufnr)
                    end
                }
            }
        end
    },
    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        build = "cd app && npm i",
        init = function()
            vim.g.mkdp_filetypes = { "markdown" }
        end,
        ft = { "markdown" },
    },
    {
        'numToStr/Comment.nvim',
        opts = {
            -- add any options here
        },
        lazy = false,
    },
    {
        "smjonas/inc-rename.nvim",
        config = function()
            require("inc_rename").setup()
        end,
    }
}
local opts = {}

require("lazy").setup(plugins, opts)

