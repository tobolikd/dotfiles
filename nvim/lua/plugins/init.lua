local conf = (...):match('(.+)%.[^%.]+$r') or (...) .. '.'
require(conf .. 'nvim-tree')
