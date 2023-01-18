require('lualine').setup {
    options = { theme = 'gruvbox' },
    sections = {
    -- left side

    -- right side
        lualine_x = {{
          'filetype',
          icon = { align = 'left' },
          -- icon =    {'X', align='right'}
          -- Icon string ^ in table is ignored in filetype component
        }} -- lualine_x
    } -- sections
}
