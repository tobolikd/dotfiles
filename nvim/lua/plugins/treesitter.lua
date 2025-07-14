require'nvim-treesitter.configs'.setup {
  ensure_installed = { "c", "lua", "typst", "rust", "vim", "vimdoc", "markdown" },
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },
}
