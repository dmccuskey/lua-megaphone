# lua-megaphone



== Overview ==

The Megaphone is to be used for inter-app communication

This is a singleton by nature
Because it is global, any other component, view, etc can gain access to it

As any global object it should be used for only _well-defined events_!


== Usage ==


=== Access ===

this is a global variable accessible anywhere in the application.
so far messages are in one direction. there is a distinct speaker and receiver.


=== Event Listener ===

listening for global messages (ie, addEventListener):
( o/f is object or function listener )

gMegaphone:listen( o/f )


sending global messages:

gMegaphone:say( gMegaphone.DATA_RENDER_REQUEST, { ...params...} )


ignoring global messages (ie, removeEventListener):
( o/f is object or function listener, same as listen )

gMegaphone:ignore( o/f )

