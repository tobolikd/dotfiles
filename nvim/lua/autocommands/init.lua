local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

-- autocommand groop
autocmdGroup = augroup("autocmdGroup", {clear = true})

-- remove tailing whitespaces
autocmd("BufWritePre", {
    group = autocmdGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

