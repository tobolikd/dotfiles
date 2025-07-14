-- additional capabilities supported by nvim-cmp
local capabilities = require('cmp_nvim_lsp').default_capabilities()

local lsp_config = require('lspconfig')

require('mason').setup()
require('mason-lspconfig').setup({
    ensure_installed = { 'pyright', 'clangd', 'lua_ls', 'texlab', 'rust_analyzer' },
    automatic_installation = true,
    handlers = {
        function(server) -- default handler
            lsp_config[server].setup {
                capabilities = capabilities,
            }
        end,
        ['lua_ls'] = function(server)
            lsp_config[server].setup {
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
        ['tinymist'] = function(server)
            lsp_config[server].setup {
                capabilities = capabilities,
                -- offset_encoding = "utf-8",
                settings = {
                    formatterMode = "typstfmt",
                    formatterPrintWidth = 80,
                    semanticTokens = "disable",
                    exportPdf = "onType"
                }
            }
        end,
        ['html'] = function(server)
            lsp_config[server].setup {
                capabilities = capabilities,
                opts = {
                    settings = {
                        html = {
                            format = {
                                templating = true,
                                wrapLineLength = 120,
                                wrapAttributes = 'auto',
                            },
                            hover = {
                                documentation = true,
                                references = true,
                            },
                        },
                    },
                },
                filetypes = { "html", "xhtml" },
            }
        end,
    },

})
