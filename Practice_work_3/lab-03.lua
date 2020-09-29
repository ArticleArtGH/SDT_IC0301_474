#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk
gdk = lgi.Gdk
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-03.glade')

--[[screen = gdk_screen_get_default();
provider = gtk_css_provider_new();
gtk_css_provider_load_from_resource (provider,
'/SDT_IC0301_474/Practice_work_3/styles_lua.css');
gtk_style_context_add_provider_for_screen (screen,
provider, GTK_STYLE_PROVIDER_PRIORITY_APPLICATION);]]

prov = gtk.CssProvider()
prov:load_from_path('styles_lua.css')

context = gtk.StyleContext()
screen = gdk.Screen.get_default()
context.add_provider_for_screen(screen, prov,
gtk.STYLE_PROVIDER_PRIORITY_APPLICATION)

--@import url('styles_lua.css');

ui = bld.objects

arr_radio_btn = {ui.radio_btn_A, ui.radio_btn_B,
ui.radio_btn_C, ui.radio_btn_D, ui.radio_btn_E,
ui.radio_btn_F, ui.radio_btn_G, ui.radio_btn_H}

function update()
x=0
y=0
z=0

if ui.check_btn_X.active==true then x = 1 end
if ui.check_btn_Y.active==true then y = 1 end
if ui.check_btn_Z.active==true then z = 1 end

value=x+y*2+z*4
arr_radio_btn[value+1].active = true

ui.lbl_res.label=value
end

function ui.check_btn_X:on_clicked()
update()
end
function ui.check_btn_Y:on_clicked()
update()
end
function ui.check_btn_Z:on_clicked()
update()
end

ui.wnd.title = 'lab-03'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()
