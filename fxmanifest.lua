fx_version 'cerulean'
games { 'rdr3', 'gta5' }

description 'Erazaya Clothing'

author 'Erazaya'

-- shared_scripts {
--     'config.lua',
-- }


client_scripts {
    '@PolyZone/client.lua',
    '@PolyZone/CircleZone.lua',
    '@PolyZone/BoxZone.lua', 
    'client/*',
}
server_scripts {
    'server/*',
    '@qb-smallresources/server/logs.lua',
    '@oxmysql/lib/MySQL.lua',
}

shared_script '@ox_lib/init.lua'

lua54 'yes'
