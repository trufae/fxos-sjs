FirefoxOS SystemJavaScript
==========================

Did you ever felt the need to run a NodeJS application in your FirefoxOS device?

Surely, this is not the way to go for a standard FxOS device, because those
extended services should be supported by b2g following the correct discussion
channels and designing the javascript APIs and permissions to grant this to
some applications.

But... this is rather an experiment, which I think it can be fun to test, not only
on FirefoxOS phones, but also, tablets, IoT devices or so..

--pancake

Installation
------------

	make install

This makefile target will move the old b2g binary to b2g.orig and push a script
that runs JXCore (NodeJS-compatible) daemon in background while running b2g.orig
at boot time. You'll just need to reboot to get that thing working.

The index.js (or other scripts you put in there) will be in `/data/local/tmp/www`

	make reboot

Restarting
----------

In order to restart the jx service just kill `jx` or run this:

	make restart

Uninstall
---------

	make uninstall

Notes
-----

In theory the /system/b2g is not modified when doing OTA updates, so this service
should be

The plan for fxos-sjs is to write an rc.d-like service that allows us to start/stop
services like sshd, telnet, syncthing, rsyncd, terminal, system webapps etc...

This service was originally developed in Go, under the name of `fxos-lws` but I
decided to rewrite it in NodeJS using JXCore because doing it dynamically provides
better development experience and the final binary size of the Go program was bigger
than the whole jxcore binary + npm dependencies.

The administration can be done by doing http auth authentication to localhost, fxos
system already provides proper support for this, because each application will store
those credentials by its own, so there's no danger in 3rd party apps executing
system code via REST in that jxcore service.

References
----------
* http://jxcore.com/
