# lua-megaphone

try:
	if not gSTARTED: print( gSTARTED )
except:
	MODULE = "lua-megaphone"
	include: "../DMC-Lua-Library/snakemake/Snakefile"

module_config = {
	"name": "lua-megaphone",
	"module": {
		"files": [
			"lua_megaphone.lua"
		],
		"requires": [
			"lua-objects"
		]
	},
	"tests": {
		"files": [
		],
		"requires": [
		]
	}
}

register( "lua-megaphone", module_config )


