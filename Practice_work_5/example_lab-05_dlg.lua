#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.require('Gtk')
gtk.init()

test = gtk.MessageDialog
{
	message_type = gtk.MessageType.INFO,
	buttons = gtk.ButtonsType.OK,
	text = "this is a message",
	secondary_text = "detailed description"
}

test:run{}
