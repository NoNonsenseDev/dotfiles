-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local install_lazy = function()
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
end

install_lazy()

require("lazy").setup({
  "nvim-lua/plenary.nvim",
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  "hrsh7th/nvim-cmp",
  "hrsh7th/cmp-nvim-lsp",
  "hrsh7th/cmp-nvim-lua",
  "hrsh7th/cmp-buffer",
  "hrsh7th/cmp-path",
  "hrsh7th/cmp-cmdline",
  "hrsh7th/cmp-nvim-lsp-signature-help",
  "onsails/lspkind.nvim",
  "b0o/schemastore.nvim",
  "SirVer/ultisnips",
  "quangnguyen30192/cmp-nvim-ultisnips",
  { "nvim-treesitter/nvim-treesitter", build = ":TSUpdate" },
  "nvim-treesitter/nvim-treesitter-context",
  "nvim-treesitter/nvim-treesitter-textobjects",
  "nvim-tree/nvim-web-devicons",
  "lewis6991/gitsigns.nvim",
  "nvim-lualine/lualine.nvim",
  "lukas-reineke/indent-blankline.nvim",
  "notjedi/nvim-rooter.lua",
  "kdheepak/lazygit.nvim",
  { "folke/tokyonight.nvim",           lazy = false, },
  { 'folke/todo-comments.nvim',        event = 'VimEnter', dependencies = { 'nvim-lua/plenary.nvim' }, opts = { signs = false } },
  "andymass/vim-matchup",
  "ruifm/gitlinker.nvim",
  "github/copilot.vim",
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.8",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  { 'nvim-telescope/telescope-fzf-native.nvim', build = 'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build' },
  {
    'stevearc/oil.nvim',
    opts = {},
    -- Optional dependencies
    dependencies = { "nvim-tree/nvim-web-devicons" },
  },
  {
    'stevearc/dressing.nvim',
    opts = {},
  },
  "nvim-telescope/telescope-ui-select.nvim",
  {
    dir = "~/code/llm-sidekick.nvim",
    config = function()
      require('llm-sidekick').setup({
        aliases = {
          deepseek = "deepseek-chat",
          exp_gemini = "gemini-exp-1206",
          flash = "gemini-2.0-flash-exp",
          mini = "o1-mini",
          o1 = "o1-preview",
          sonnet = "anthropic.claude-3-5-sonnet-20241022-v2:0",
          think_flash = "gemini-2.0-flash-thinking-exp-1219",
        },
        default = "sonnet",
      })
    end,
  },
  "Marskey/telescope-sg",
  {
    'MeanderingProgrammer/render-markdown.nvim',
    dependencies = { 'nvim-treesitter/nvim-treesitter', 'nvim-tree/nvim-web-devicons' },
    ---@module 'render-markdown'
    ---@type render.md.UserConfig
    opts = {},
  },
  {
    'laytan/cloak.nvim',
    config = function()
      require('cloak').setup()
    end
  },
  "AndrewRadev/splitjoin.vim",
  "junegunn/vim-easy-align",
  "vim-test/vim-test",
  "schickling/vim-bufonly",
  "tpope/vim-projectionist",
  "tpope/vim-surround",
  "tpope/vim-repeat",
  "pangloss/vim-javascript",
  "peitalin/vim-jsx-typescript",
  "leafgarland/typescript-vim",
  "moll/vim-node",
  "hashivim/vim-terraform",
  "tpope/vim-rails",
  "tpope/vim-bundler",
  "editorconfig/editorconfig-vim",
})
