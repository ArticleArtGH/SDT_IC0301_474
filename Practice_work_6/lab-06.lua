#!/usr/bin/lua5.3

lgi = require 'lgi'
--package.loaded[lsqlite3]
sqlite = require 'lsqlite3'

gtk = lgi.Gtk
pb = lgi.GdkPixbuf.Pixbuf

gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-06.glade')

ui = bld.objects

rdr_txt = gtk.CellRendererText{}
rdr_pb = gtk.CellRendererPixbuf{}

c1 = gtk.TreeViewColumn { title = 'Name', { rdr_txt, { text = 1 }} }
c2 = gtk.TreeViewColumn { title = 'Value', { rdr_txt, { text = 2 }} }
c3 = gtk.TreeViewColumn { title = 'Image', { rdr_pb, { pixbuf = 3 }} }

ui.tree:append_column(c1)
ui.tree:append_column(c2)
ui.tree:append_column(c3)

db = sqlite.open('lab-06.db')
--print(db)
for row in db:nrows('select * from list') do
print(row.name, row.valie, row.image)
--local pb = pixbuf.new_from_file(row.image)

img = pb.new_from_file(row.image)

el = ui.tree_mdl:append()
ui.tree_mdl[el] = { [1] = row.name, [2] = row.value, [3] =  img}
end

db:close()

ui.wnd.title = 'lab-06'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
