redis = require 'redis'
lgi = require 'lgi'

gtk = lgi.Gtk
glib = lgi.GLib

bld = gtk.Builder()
bld:add_from_file('lab-12.glade')

ui = bld.objects

x = 0
y = 0
btn = 0
sr = 0
sg = 0
sb = 0

function ui.canvas:on_button_press_event(ev)
	print('press')
	btn = 1
	ui.canvas:queue_draw()
	update_keys()
end

function ui.canvas:on_button_release_event(ev)
	print('release')
	btn = 0
	ui.canvas:queue_draw()
	update_keys()
end

function ui.canvas:on_motion_notify_event(ev)
	print(x, y)
	x = ev.x
	y = ev.y
	ui.canvas:queue_draw()
	update_keys()
end

function ui.scl_r:on_value_changed()
	sr = ui.scl_r:get_value()
	ui.canvas:queue_draw()
	update_keys()
end

function ui.scl_g:on_value_changed()
	sg = ui.scl_g:get_value()
	ui.canvas:queue_draw()
	update_keys()
end

function ui.scl_b:on_value_changed()
	sb = ui.scl_b:get_value()
	ui.canvas:queue_draw()
	update_keys()
end

function ui.canvas:on_draw(cr)
	cr:set_source_rgb(1, 1, 1, 1)
	cr:paint()
	
	local cid = cli:lrange('clients', 0, -1)-- get client list
	for i = 1, #cid do-- for each client
		--cname = tonumber(cli:get(cli[i] .. name))
		cx = tonumber(cli:get(cid[i] .. '-x'))
		cy = tonumber(cli:get(cid[i] .. '-y'))
		cbtn = tonumber(cli:get(cid[i] .. '-btn'))
		csr = tonumber(cli:get(cid[i] .. '-sr'))
		csg = tonumber(cli:get(cid[i] .. '-sg'))
		csb = tonumber(cli:get(cid[i] .. '-sb'))

	cr:set_source_rgb(csr, csg, csb, 1)
	if cbtn == 0 then
		cr:rectangle(cx - 5, cy - 5, 10, 10)
	else
		cr:rectangle(cx - 10, cy - 10, 20, 20)
	end
	cr:fill()

	cr:move_to(cx, cy - 10)
	--cr:show_text(cid[i] .. ': '..name)
	cr:show_text(cid[i])
	end 
end

ui.wnd.on_destroy = gtk.main_quit
ui.wnd:show_all()

--connect to redis server
cli = redis.connect('redis.fxnode.ru')

--generate random client id
math.randomseed(os.time())
id = ''
for i = 1, 8 do
	local j = math.random(1, 16)
	id = id .. string.sub('0123456789abcdef', j, j)
end
print('client id', id)

function update_keys()-- update keys
	cli:set(id .. '-ts', os.time())
	cli:set(id .. '-x', x)
	cli:set(id .. '-y', y)
	cli:set(id .. '-btn', btn)
	cli:set(id .. '-sr', sr)
	cli:set(id .. '-sg', sg)
	cli:set(id .. '-sb', sb)

	glib.timeout_add(glib.PRIORITY_DEFAULT, 1000, update_keys)
end

function update_view()
	ui.canvas:queue_draw()
	glib.timeout_add(glib.PRIORITY_DEFAULT, 25, update_view)
end

glib.timeout_add(glib.PRIORITY_DEFAULT, 25, update_view)

update_keys()-- initialize keys
cli:lpush('clients', id)-- add client to client list

gtk.main()
