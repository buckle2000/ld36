-- classes!

Entity = Class{
	init = function (self, x, y, w, h, texture)
		x = x or 0
		y = y or 0
		w = w or 30
		h = h or 30
		self.pos = vec2(x, y)
		self.w = w
		self.h = h
		self.anchor = vec2(w/2, h/2)
		World:add(self, x, y, w, h)
		self.texture = debug_image(w, h, {160,136,247})
	end,
	draw = function (self)
		love.graphics.draw(self.texture, self.pos:unpack())
	end,
	move = function (self, dx, dy, filter)
		local x,y = self.pos:unpack()
		local actualX, actualY, cols = World:move(self, x+dx, y+dy, filter)
		self.pos:set(actualX, actualY)
		self:after_col(cols)
	end,
	update = function (dt) end,  -- dummy
	after_col = function (self, cols) end,  -- on collision
}

Player = Class{
	__includes = Entity,
	init = function (self, ...)
		Entity.init(self, ...)

	end,
	update = function (self, dt)
		local dx, dy = keyasanalog('up','down','left','right')
		local m = 100 * dt
		self:move(dx * m, dy * m)
	end,
}
