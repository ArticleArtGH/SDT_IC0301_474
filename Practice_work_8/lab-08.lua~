#!/usr/bin/lua5.3

local lgi = require 'lgi'

local glib = lgi.GLib
local gtk = lgi.Gtk

gtk.init()

-- connect to redis keystore db
local rds = require 'redis'
local cli = rds.connect('redis.fxnode.ru', 6379)--('127.0.0.1', 6379)

local t = 0 -- global time

local function on_timer()
	t = t + 0.1 -- increment time

	local x = 50 + math.cos(t) * 25 -- compute new coordinates
	local y = 50 + math.sin(t) * 25

	-- update values in redis keystore
	cli:set('x-Chernykh_Artyom', x)
	cli:set('y-Chernykh_Artyom', y)

	-- schedule call after ~10 ms
	glib.timeout_add(glib.PRIORITY_DEFAULT, 10, on_timer)
	end

on_timer() -- immediate first call
gtk.main() -- process time events
