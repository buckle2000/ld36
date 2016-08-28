-- play the game!
local bump   = require("bump")
local suit   = require("SUIT")
local Signal = require("hump.signal")
local Timer  = require("hump.timer")
local Camera = require("hump.camera")
local sti    = require("sti")
local state  = {}

function state:init()
    -- Called once, and only once, before entering the state the first time. See Gamestate.switch().
end

function state:enter(previous, map)
	World = bump.newWorld()
	self.camera = Camera()
	self.pool = {}
	self.next_id = 1
	self.player = Player()
	self:add(self.player)
	self.camera_offset = vec2(love.graphics.getDimensions())/2
end

function state:add(entity)
	-- if a person lost his id, he is considered dead
	-- and remember, never keep strong reference, keep id only
	local id = self.next_id
	self.pool[id] = entity
	self.next_id = id + 1
	entity.id = id
	entity.state = self
	return entity
end

function state:remove(id)
	local entity
	if type(id)=="number" then
		entity = self.pool[id]
	else
		entity = self.pool[entity.id]
	end
	assert(entity, "Entity "..id.." don't exist.")
	entity.id = nil
	return entity
end

function state:leave()
    -- Called when leaving a state. See Gamestate.switch() and Gamestate.push().
end

function state:resume()
    -- Called when re-entering a state by Gamestate.pop()-ing another state.
end

function state:update(dt)
	for i,v in ipairs(self.pool) do
		v:update(dt)
	end
end

function state:draw()
	-- local camera = self.camera
	-- local player = self.player
	-- camera:lookAt((player.pos + player.anchor - self.camera_offset):unpack())
	-- camera:attach()
	for i,v in ipairs(self.pool) do
		v:draw()
	end
	-- camera:detach()
	-- draw hud
end

function state:quit()
    -- Called on *quitting the game*. Only called on the active gamestate.
end


return state
