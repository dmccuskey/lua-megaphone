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
			local event, data
			local etype = 'bogus_event'
			local callback = function( e )
				event = e
			end

			-- test no data

			assert.is_not.error( function() Megaphone:listen( callback ) end )
			assert.is_not.error( function() Megaphone:say( etype ) end )

			assert.is.equal( event.name, 'megaphone_event' )
			assert.is.equal( event.type, etype )
			assert.is.equal( event.data, nil )

			event = nil

			-- test string data

			assert.is_not.error( function() Megaphone:say( etype, "hello" ) end )

			assert.is.equal( event.name, 'megaphone_event' )
			assert.is.equal( event.type, etype )
			assert.is.equal( event.data, "hello" )

			event = nil

			data = {one=1}
			assert.is_not.error( function() Megaphone:say( etype, data ) end )

			assert.is.equal( event.name, 'megaphone_event' )
			assert.is.equal( event.type, etype )
			assert.is.equal( event.data, data )

			event = nil

			data = {one=1,two=2}
			assert.is_not.error( function() Megaphone:say( etype, data, {merge=true} ) end )

			assert.is.equal( event.name, 'megaphone_event' )
			assert.is.equal( event.type, etype )
			assert.is.equal( event.one, data.one )
			assert.is.equal( event.two, data.two )

			event = nil

			assert.is_not.error( function() Megaphone:ignore( callback ) end )
			assert.is_not.error( function() Megaphone:say( etype ) end )

			assert.is.equal( event, nil )

		end)

		it( "throws errors with improper params", function()
			local etype = 'bogus_event'
			local data = "hello"
			assert.is.error( function() Megaphone:say( etype, data, "params" ) end )
			assert.is.error( function() Megaphone:say( etype, data, 2 ) end )
			assert.is.error( function() Megaphone:say( etype, nil, "params" ) end )
			assert.is.error( function() Megaphone:say( etype, nil, 2 ) end )
		end)

	end)


end)







