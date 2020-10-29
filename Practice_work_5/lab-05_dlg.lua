#!/usr/bin/lua5.3

lgi = require 'lgi'

gtk = lgi.Gtk--lgi.require('Gtk')
gtk.init()

bld = gtk.Builder()
bld:add_from_file('lab-05_dlg.glade')

ui = bld.objects

txt = ""
sec_txt = ""

function msg()
test = gtk.MessageDialog
{
message_type = gtk.MessageType.INFO,
buttons = gtk.ButtonsType.OK,
text = txt,
secondary_text = sec_txt
}
test:run{}
test:destroy{}
end

function ui.btn_new:on_clicked()
ui.wnd2:show_all()
txt = "wnd"
sec_txt = ui.ent_mFw2.text

msg()
end

function ui.btn_hide:on_clicked()
ui.wnd2:hide()	
txt = "wnd2"
sec_txt = ui.ent_mFw.text

msg()
end

ui.wnd.title = 'lab-05_dlg(wnd)'
ui.wnd2.title = 'lab-05_dlg(wnd2)'
ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

gtk.main()

