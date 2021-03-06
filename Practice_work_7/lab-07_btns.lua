#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
cairo = lgi.cairo
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-07_btns.glade')

ui = bld.objects

a = false
b = false

function ui.btn_a:on_clicked()
a = true
b = false
end
function ui.btn_b:on_clicked()
b = true
a = false
end

function ui.canvas:on_draw(cr)
cr:set_source_rgb(1, 1, 1)
cr:paint()

if a~=true and b~=true then
for x = 1, 10 do
   for y = 1, 10 do
      cr:set_source_rgb(0.5, 0.5, 0.5)
      cr:rectangle(x * 10, y * 10, 10, 10)
      cr:fill()
      end
end
elseif a==true then
btn_a(cr)
elseif b==true then
btn_b(cr)
end

return true
end

function btn_a(cr)

for x = 1, 10 do
   for y = 1, 10 do
	cr:set_source_rgb(x / 10, y / 10, 0.75)
	cr:rectangle(x * 10, y * 10, 10, 10)
	cr:fill()
	end
end

ui.canvas:queue_draw()
end

function btn_b(cr)

for x = 1, 10 do
   for y = 10, 1, -1 do
	cr:set_source_rgb(x / 10, y / 10, 0.75)
	cr:rectangle(y * 10, x * 10, 10, 10)
	cr:fill()
	end
end

ui.canvas:queue_draw()
end

function ui.wnd:on_destroy()
gtk.main_quit()
end

ui.wnd.title = 'lab-07'
--ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
