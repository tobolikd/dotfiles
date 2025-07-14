local map = vim.keymap.set
local opts = { noremap = true, silent = true }

vim.g.mapleader = ' '

map('n', '<leader>e', ':NvimTreeToggle <CR>', opts)
map('n', 'j', 'gj', opts)
map('n', 'k', 'gk', opts)
map('v', 'j', 'gj', opts)
map('v', 'k', 'gk', opts)

-- telescope
local telescope = require('telescope.builtin')
map('n', '<leader>ff', telescope.find_files, opts)
map('n', '<leader>fg', telescope.live_grep, opts)
map('n', '<leader>fr', telescope.lsp_references, opts)
map('n', '<leader>fs', telescope.lsp_dynamic_workspace_symbols, opts)
map('n', '<leader>fb', telescope.buffers, opts)
map('n', '<leader>fh', telescope.help_tags, opts)

-- conform
local conform = require("conform")
vim.keymap.set('n', '<leader>fm',
    function()
        conform.format({
            lsp_fallback = true,
            timeout_ms = 500,
            async = true,
        })
    end
    , opts)

-- lsp
local opts = { noremap = true, silent = true }
map('n', '<leader>d', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<leader>q', vim.diagnostic.setloclist, opts)

local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd
local lsp_augroup = augroup("LspKeymaps", { clear = true })

autocmd('LspAttach', {
    group = lsp_augroup,
    callback = function(args)
        local bufnr = args.buf

        vim.bo[bufnr].omnifunc = 'v:lua.vim.lsp.omnifunc'

        map('n', 'gD', vim.lsp.buf.declaration)
        map('n', 'gd', vim.lsp.buf.definition)
        map('n', 'K', vim.lsp.buf.hover)
        map('n', 'gi', vim.lsp.buf.implementation)
        map('n', '<C-k>', vim.lsp.buf.signature_help)
        map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder)
        map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder)
        map('n', '<leader>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end)
        map('n', '<leader>D', vim.lsp.buf.type_definition)
        map('n', '<leader>rn', vim.lsp.buf.rename)
        map('n', '<leader>ca', vim.lsp.buf.code_action)
        map('n', 'gr', vim.lsp.buf.references)
    end,
})
