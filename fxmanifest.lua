fx_version 'cerulean'
game 'gta5'
lua54 'yes'


name 'SUK-LSD'
description 'A Drug script for Qb-Core!'
author 'Silvias.uk'
version '1.0'

shared_scripts{
    'config.lua',
    '@qb-core/shared/locale.lua',
    'locales/en.lua', -- Change to the language you want
}

client_scripts{
    'client/client.lua',
}

server_scripts{
    'server/server.lua'
}