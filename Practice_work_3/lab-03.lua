#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
git.init()

bld = gtk.Builder()
bld:add_from_file('lab-03.glade')

ui = bld.objects

function ui.check_btn_X:on_clicked()
update()
end
function ui.check_btn_Y:on_clicked()
update()
end

function main()
x=0
y=0

if ui.check_btn_X.active==true then x = 1 end
if ui.check_btn_Y.active==true then y = 1 end


end

ui.wnd.title = 'lab-03'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
