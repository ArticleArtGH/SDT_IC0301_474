#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
pixbuf = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-04.glade')

ui = bld.objects

function ui.btn_add_item:on_clicked()
name = ui.ent_name.text
value = tonumber(ui.ent_value.text)

pb = pixbuf.new_from_file('img/img-blueberry.png')

i = ui.mdl_items:append()
ui.mdl_items[i] = {[1] = name, [2] = value,
[3] = pb}
end

rdr_txt = gtk.CellRenderText{}
rdr_pb = gtk.CellRenderPixbuf{}

c1 = gtk.TreeViewColumn {title = 'Name', {rdr_txt, {text = 1 }} }
c2 = gtk.TreeViewColumn {title = 'Value', {rdr_txt, {text = 2}} }
c3 = gtk.TreeViewColumn {title = 'Image',
{rdr.pb {pixbuf = 3}} }

ui.tr_v_items:append_column(c1)
ui.tr_v_items:append_column(c2)
ui.tr_v_items:append_column(c3)

ui.wnd.title = 'lab-04'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
