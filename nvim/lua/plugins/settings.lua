-- lsp ui customization
vim.diagnostic.config({
    signs = true,
    underline = true,
    update_in_insert = true,
    severity_sort = false,
    virtual_text = {
        prefix = '●',
    },
})

-- fancy icons in sign column
local signs = { Error = "", Warn = "", Hint = "", Info = "" }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end
