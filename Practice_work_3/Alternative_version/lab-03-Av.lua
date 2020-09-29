#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03-Av.glade')

prov = gtk.CssProvider()
prov:load_from_path('styles_lua_Av.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

ui = bld.objects

arr_cb = {ui.check_btn_W, ui.check_btn_X,
ui.check_btn_Y, ui.check_btn_Z}

function ui.ent_value:on_grab_focus()
if ui.ent_value.text == 'error' then
ui.ent_value.text='' end
end

function ui.btn_go:on_clicked()
for i=0, 3, 1 do
arr_cb[i+1].active=false
end
value = tonumber(ui.ent_value.text)
j=8

for i,el in ipairs(arr_cb) do
if (value >= 0 and value <= 15)and value~=nil then
if value/j>=1 then el.active=true
value=value%j 
end
j=j/2
else value = nil ui.ent_value.text = 'error' 
end
end
end

ui.wnd.title = 'lab-03-Av'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
