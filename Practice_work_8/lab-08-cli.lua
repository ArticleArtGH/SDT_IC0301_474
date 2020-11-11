#!/usr/bin/lua5.3

rds = require 'redis' -- connect to redis keystore
cli = rds.connect('redis.fxnode.ru', 6379)

lgi = require 'lgi'

glib = lgi.GLib
gtk = lgi.Gtk

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-08.glade')

ui = bld.objects

x = 0 -- last know coordinates
y = 0

function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1,1,1) -- fill background
	cr:paint()

	cr:set_source_rgb(0, 0.5, 1, 1) --draw smal rectangle at given position
	cr:rectangle(x, y, 10, 10)
	cr:fill()

	return true
end

function ui.wnd:on_destroy()
	gtk.main_quit() -- leave event loop
end

function on_timer()
	x = cli:get('x-Chernykh_Artyom')
	y = cli:get('y-Chernykh_Artyom')

	ui.canvas:queue_draw()
	glib.timeout_add(glib.PRIORITY_DEFAULT, 10, on_timer) --- schedule next run
end

ui.wnd:show_all()

on_timer() -- immediate firs call

gtk.main() -- event loop
