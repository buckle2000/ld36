-- Gamestate template

local state = {}

function state:init()
    -- Called once, and only once, before entering the state the first time. See Gamestate.switch().
end

function state:enter(previous, ...)
    -- Called every time when entering the state. See Gamestate.switch().
end

function state:leave()
    -- Called when leaving a state. See Gamestate.switch() and Gamestate.push().
end

function state:resume()
    -- Called when re-entering a state by Gamestate.pop()-ing another state.
end

function state:update(dt)
    -- Update the game state. Called every frame.
end

function state:draw()
    -- Draw on the screen. Called every frame.
end

function state:quit()
    -- Called on *quitting the game*. Only called on the active gamestate.
end


return state
