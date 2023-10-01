local map = vim.keymap.set

-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
map('n', '<leader>d', vim.diagnostic.open_float, opts)
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
map('n', '<leader>q', vim.diagnostic.setloclist, opts)

local on_attach = function(client, bufnr)
    -- Enable completion triggered by <c-x><c-o>
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local bufopts = { noremap = true, silent = true, buffer = bufnr }
    map('n', 'gD', vim.lsp.buf.declaration, bufopts)
    map('n', 'gd', vim.lsp.buf.definition, bufopts)
    map('n', 'K', vim.lsp.buf.hover, bufopts)
    map('n', 'gi', vim.lsp.buf.implementation, bufopts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
    map('n', '<leader>wa', vim.lsp.buf.add_workspace_folder, bufopts)
    map('n', '<leader>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
    map('n', '<leader>wl', function()
        print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, bufopts)
    map('n', '<leader>D', vim.lsp.buf.type_definition, bufopts)
    map('n', '<leader>rn', vim.lsp.buf.rename, bufopts)
    map('n', '<leader>ca', vim.lsp.buf.code_action, bufopts)
    map('n', 'gr', vim.lsp.buf.references, bufopts)
    map('n', '<leader>f', function() vim.lsp.buf.format { async = true } end, bufopts)
end

-- additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = require('lspconfig')

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'clangd', 'lua_ls', 'texlab', 'bashls', 'marksman', 'rust_analyzer' },
    automatic_installation = true,
    handlers = {
        -- setup all servers
        function(server)
            lsp_config[server].setup {
                on_attach = on_attach,
                capabilities = capabilities,
            }
        end,
        ['lua_ls'] = function(server)
            lsp_config[server].setup {
                on_attach = on_attach,
                capabilities = capabilities,
                settings = {
                    Lua = {
                        diagnostics = {
                            globals = { 'vim' }
                        }
                    }
                }
            }
        end,
    }
})
