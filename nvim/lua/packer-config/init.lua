return require('packer').startup(function()
    -- packer
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'gruvbox-community/gruvbox'

    -- file explorer
    use{ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

    -- lsp
    use 'neovim/nvim-lspconfig'

    -- autocompletion
    use 'hrsh7th/nvim-cmp' -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp' -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip' -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip' -- Snippets plugin
end)
