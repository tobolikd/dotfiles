local augroup = vim.api.nvim_create_augroup
local autocmd = vim.api.nvim_create_autocmd

autocmdGroup = augroup("autocmdGroup", {clear = true})

autocmd("BufWritePre", {
    group = autocmdGroup,
    pattern = "*",
    command = "%s/\\s\\+$//e",
})

