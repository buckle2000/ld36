-- My own utility functions

function foreach(list, apply, ...)
	-- ... more arguments
	for i=1,#list do
		apply(list[i], ...)
	end
end

function table.contains(t, val)
	for i=1,#t do
		if t[i] == val then 
			return true
		end
	end
	return false
end

function debug_image(width, height, fill_color)
	local image_data = love.image.newImageData(width, height)
	fill_color = fill_color or {255, 255, 255}
	for x=0,width-1 do
		for y=0,height-1 do
			image_data:setPixel(x, y, unpack(fill_color))
		end
	end
	return love.graphics.newImage(image_data)
end

function keyasanalog(up, down, left, right)
	local dx, dy = 0, 0
	if love.keyboard.isDown(up)    then dy = dy - 1 end
	if love.keyboard.isDown(down)  then dy = dy + 1 end
	if love.keyboard.isDown(left)  then dx = dx - 1 end
	if love.keyboard.isDown(right) then dx = dx + 1 end
	return dx, dy
end
