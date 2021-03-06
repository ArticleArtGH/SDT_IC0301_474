#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

local wnd = gtk.Window
{
	title = 'app',
	--default_width = 256,
	--default_height = 256,
	on_delete_event = gtk.main_quit,
	gtk.Box
	{
		border_width = 4,
		spacing = 4,
		orientation = 'VERTICAL',
		gtk.DrawingArea
		{
			expand = true,
			id = 'canvas',
			width = 256,
			height = 256
		},
		gtk.Box
		{
			orientation = 'HORIZONTAL',
			spacing = 4,
			gtk.Button
			{
				id = 'button1',
				label = 'a'
			},
			gtk.Button
			{
				id = 'button1',
				label = 'b'
			}
		}
	}
}

local cnv = wnd.child.canvas
local btn1 = wnd.child.button1
local btn2 = wnd.child.button2

wnd:show_all()
gtk.main()
