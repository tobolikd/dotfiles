local conf = (...):match('(.+)%.[^%.]+$r') or (...) .. '.'

require(conf .. 'language-servers')
require(conf .. 'cmp-config')
