#!/usr/bin/lua5.3

local lgi = require 'lgi'

local gtk = lgi.Gtk
--local cairo = lgi.cairo

gtk.init()-- It can not to use, why ? 

local bld = gtk.Builder()
bld:add_from_file('lab-09.glade')

local ui = bld.objects

local x = 0-- position
local y = 0

local btn = false

local sr = 0-- color
local sg = 0
local sb = 0

function ui.canvas:on_button_press_event(ev)-- mouse down
print('press')
btn = true
ui.canvas:queue_draw()
end

function ui.canvas:on_button_release_event(ev)-- mouse up
print('release')
btn = false
ui.canvas:queue_draw()
end

function ui.canvas:on_motion_notify_event(ev)-- mouse move
print(ev.x, ev.y)
x = ev.x
y = ev.y
ui.canvas:queue_draw()
end

function ui.scl_r:on_value_changed()-- red slider
sr = ui.scl_r:get_value()
ui.canvas:queue_draw()
end

function ui.scl_g:on_value_changed()-- green slider
sg = ui.scl_g:get_value()
ui.canvas:queue_draw()
end

function ui.scl_b:on_value_changed()-- blue slider
sb = ui.scl_b:get_value()
ui.canvas:queue_draw()
end

function ui.canvas:on_draw(cr)-- paint
cr:set_source_rgb(1, 1, 1, 1)-- background
cr:paint()

	cr:set_source_rgb(sr, sg, sb, 1)
	if btn == false then-- small rectangle
		cr:rectangle(x - 5, y - 5, 10, 10)
	else-- large rectangle
		cr:rectangle(x - 10, y - 10, 20, 20)
	end
	cr:fill()
end

--[[function ui.canvas:on_draw(cr)
cr:set_source_rgb(1, 1, 1)-- background
cr:paint()

cr:set_source_rgb(sr, sg, sb)-- color object
cr:rectangle(x, y, 10, 10)-- square
cr:fill()

return true
end]]

ui.wnd.on_destroy = gtk.main_quit-- exit
--[[function ui.wnd:on_destroy()-- exit
gtk.main_quit()
end]]

ui.wnd:show_all()

gtk.main()
