## lua-megaphone ##


### Overview ###

The Megaphone is to be used for inter-app communication

This is a singleton by nature and is global. Because it is global, any other component, view, etc can gain access to it to send and receive messages.

As any global object it should be used for only _well-defined events_!


### Usage ###

Import the object in a file for your app. Then embellish the object with 

=== Access ===

```lua
-- in a file in you app, say 'service/megaphone.lua'

-- setup in app
local Megaphone = require 'dmc_corona.dmc_megaphone'

-- add message information to this object

Megaphone.GAME_OVER_EVENT = 'game-over-event'

-- then return

return Megaphone
```

```lua
-- in your core app file (eg, app controller, main, etc)
-- import your version of Megaphone and make global

_G.gMegaphone = require 'service.megaphone'

```

#### Event Listen ####

Use method `listen` to receive global messages ( ie, like addEventListener() ):
( the actual listener can be either an object or function )

`gMegaphone:listen( <obj or func> )`

```lua
-- in one of your files/classes wanting to receive messages

local f = function(event)
  if event.type == gMegaphone.GAME_OVER_EVENT then 
    -- do game over stuff
  end
end
gMegaphone:listen( f )
```

#### Sending Messages ####

Send global messages by using method `say`. The first arg is the message type, the second optional arg is any data.

`gMegaphone:say( <message type>, <data> )`

gMegaphone:say( gMegaphone.DATA_RENDER_REQUEST, { ...params...} )

```lua
-- in one of your files/classes dispatch a message
gMegaphone:say( gMegaphone.GAME_OVER_EVENT )
```

#### Event Ignore ####

Use method `ignore` to stop receiving global messages ( ie, like removeEventListener() ):
( the actual listener should be same reference given in `listen` )

`gMegaphone:ignore( <obj or func> )`

```lua
local f = function(event)
  if event.type == gMegaphone.GAME_OVER_EVENT then 
    -- do game over stuff
  end
end
gMegaphone:listen( f )

-- later in app
gMegaphone:ignore( f )
```

