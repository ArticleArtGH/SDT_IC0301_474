#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-000.glade')

ui = bld.objects

ui.wnd.title('lab-000')
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
