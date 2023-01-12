-- ensure packer is installed
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
    -- packer
    use 'wbthomason/packer.nvim'

    -- colorscheme
    use 'gruvbox-community/gruvbox'

    -- file tree
    use { 'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- lualine
    use { 'nvim-lualine/lualine.nvim',
        requires = 'kyazdani42/nvim-web-devicons'
    }

    -- lsp
    use 'neovim/nvim-lspconfig'

    -- treesitter
    use { 'nvim-treesitter/nvim-treesitter',
        run = function()
            local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
            ts_update()
        end,
    }

    -- autocompletion
    use 'hrsh7th/nvim-cmp'          -- Autocompletion plugin
    use 'hrsh7th/cmp-nvim-lsp'      -- LSP source for nvim-cmp
    use 'saadparwaiz1/cmp_luasnip'  -- Snippets source for nvim-cmp
    use 'L3MON4D3/LuaSnip'          -- Snippets plugin

    -- set up plugins after cloning packer
    if packer_bootstrap then
        require('packer').sync()
    end
end)
