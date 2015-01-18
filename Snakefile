# lua-megaphone

try:
	if not gSTARTED: print( gSTARTED )
except:
	MODULE = "lua-megaphone"
	include: "../DMC-Lua-Library/snakemake/Snakefile"

module_config = {
	"name": "lua-megaphone",
	"module": {
		"dir": "dmc_lua",
		"files": [
			"lua_megaphone.lua"
		],
		"requires": [
			"lua-objects",
			"lua-events-mixin"
		]
	},
	"tests": {
		"dir": "spec",
		"files": [],
		"requires": []
	}
}

register( "lua-megaphone", module_config )


