--local redis = (require 'redis').connect('redis.fxnode.ru')
--require 'redis'
--local cli = redis.connect('redis.fxnode.ru', 6379)
--cli = redis.connect('redis.fxnode.ru')

local ttl = 3-- client timeout

--local cli = redis.call('LRANGE', 'clients', 0, -1)-- get a list of clients
local cli = redis.call('LRANGE', 'clients', 0, -1)
local now = tonumber(redis.call('TIME')[1])-- get current time

for i = 1, #cli do

	local ts = redis.call('GET', cli[i] .. '-ts')

	local rem = true
	if ts ~= false then-- key exists
		if now < ts + ttl then rem = false end-- keep alive
	end

	if rem == true then
		redis.call('LREM', 'clients', 0, cli[i])-- remove from cliets list

		redis.call('DEL', cli[i] .. '-ts')-- remove keys
		redis.call('DEL', cli[i] .. '-x')
		redis.call('DEL', cli[i] .. '-y')
		redis.call('DEL', cli[i] .. '-btn')
		redis.call('DEL', cli[i] .. '-sr')
		redis.call('DEL', cli[i] .. '-sg')
		redis.call('DEL', cli[i] .. '-sb')
	end
end

return cli
