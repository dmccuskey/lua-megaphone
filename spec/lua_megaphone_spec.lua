--====================================================================--
-- spec/lua_megaphone_spec.lua
--
-- Testing for lua-megaphone using Busted
--====================================================================--


package.path = './dmc_lua/?.lua;' .. package.path


--====================================================================--
--== Test: Lua Objects
--====================================================================--


-- Semantic Versioning Specification: http://semver.org/

local VERSION = "0.1.0"



--====================================================================--
--== Imports


local Megaphone = require 'lua_megaphone'



--====================================================================--
--== Testing Setup
--====================================================================--


describe( "Module Test: lua_megaphone.lua", function()


	describe( "megaphone has properties", function()

		it( "has property NAME", function()
			assert.is.equal( Megaphone.NAME, "Lua Megaphone" )
		end)
		it( "has property EVENT", function()
			assert.is.equal( Megaphone.EVENT, 'megaphone_event' )
		end)

		it( "has property EVENT", function()
			assert.is.equal( Megaphone.EVENT, 'megaphone_event' )
		end)

	end)


	describe( "megaphone has methods", function()

		it( "has method listen", function()
			assert.is.equal( type(Megaphone.listen), 'function' )
		end)
		it( "has method say", function()
			assert.is.equal( type(Megaphone.say), 'function' )
		end)
		it( "has method ignore", function()
			assert.is.equal( type(Megaphone.ignore), 'function' )
		end)
		it( "has method setDebug", function()
			assert.is.equal( type(Megaphone.setDebug), 'function' )
		end)

	end)


	describe( "megaphone has errors", function()

		it( "throws errors with improper params", function()
			assert.is.error( function() Megaphone:listen() end )
			assert.is.error( function() Megaphone:listen( 'event' ) end )
		end)
		it( "throws errors with improper params", function()
			assert.is.error( function() Megaphone:say( {} ) end )
			assert.is.error( function() Megaphone:say() end )
		end)
		it( "throws errors with improper params", function()
			assert.is.error( function() Megaphone:ignore() end )
			assert.is.error( function() Megaphone:ignore( 'event' ) end )
		end)

	end)


	describe( "megaphone communicates", function()

		it( "can dispatch events", function()
			assert.is_not.error( function() Megaphone:say( "hello" ) end )
		end)

		it( "can setup listener and get events", function()
			local event
			local etype = 'bogus_event'
			local callback = function( e )
				event = e
			end

			assert.is_not.error( function() Megaphone:listen( callback ) end )
			assert.is_not.error( function() Megaphone:say( etype ) end )

			assert.is.equal( event.name, 'megaphone_event' )
			assert.is.equal( event.type, etype )

			event = nil

			assert.is_not.error( function() Megaphone:ignore( callback ) end )
			assert.is_not.error( function() Megaphone:say( etype ) end )

			assert.is.equal( event, nil )

		end)

	end)


end)







