return require('packer').startup(function()
    -- packer
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'gruvbox-community/gruvbox'

    -- file explorer
    use{ 'kyazdani42/nvim-tree.lua', requires = 'kyazdani42/nvim-web-devicons' }

end)
