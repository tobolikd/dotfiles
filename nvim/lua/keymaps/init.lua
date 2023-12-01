local map = vim.api.nvim_set_keymap

local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle <CR>', opts)
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)

local telescope = require('telescope.builtin')
vim.keymap.set('n', '<leader>ff', telescope.find_files, opts)
vim.keymap.set('n', '<leader>fg', telescope.live_grep, opts)
vim.keymap.set('n', '<leader>fr', telescope.lsp_references, opts)
vim.keymap.set('n', '<leader>fs', telescope.lsp_dynamic_workspace_symbols, opts)
vim.keymap.set('n', '<leader>fb', telescope.buffers, opts)
vim.keymap.set('n', '<leader>fh', telescope.help_tags, opts)
