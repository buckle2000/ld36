Class     = require("hump.class")
Gamestate = require("hump.gamestate")
vec2      = require("hump.vector")
require("utils")
require('e')

Gamestate.registerEvents()
Gamestate.switch(require("play"))
