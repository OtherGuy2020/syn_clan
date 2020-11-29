fx_version "adamant"

rdr3_warning 'I acknowledge that this is a prerelease build of RedM, and I am aware my resources *will* become incompatible once RedM ships.'

game "rdr3"

ui_page "html/index.html"
client_script {
    'client/client.lua',
    'warmenu.lua', 
    'config.lua',
}
server_script {
    'server/server.lua',
    'config.lua',
}

files {
	'html/index.html',
	'html/script.js',
}   