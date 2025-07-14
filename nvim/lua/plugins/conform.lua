require("conform").setup({
    formatters_by_ft = {
        python = { "black" },
        rust = { "rustfmt" },
        typst = { "typstyle" },
        css = { "prettier" },
        json = { "prettier" },
        javascript = { "prettier" }
    },
})
