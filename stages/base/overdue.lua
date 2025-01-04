--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Vanilla Engine

Copyright (C) 2024 VanillaEngineDevs & HTV04

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see <https://www.gnu.org/licenses/>.
------------------------------------------------------------------------------]]

return {
    enter = function()
        stageImages = {
            ["street back trees"] = graphics.newImage(graphics.imagePath("Overdue/street/BackTrees")),
		    ["street car"] = graphics.newImage(graphics.imagePath("Overdue/street/car")),
		    ["street front trees"] = graphics.newImage(graphics.imagePath("Overdue/street/Front Trees")),
            ["street road"] = graphics.newImage(graphics.imagePath("Overdue/street/Road")),
            
            ["running floor"] = love.filesystem.load("Sprites/Overdue/Overdue_Final_BG_floorfixed.lua")(),
            ["running ceiling"] = love.filesystem.load("Sprites/Overdue/Overdue_Final_BG_topfixed.lua")(),
            ["running luigi front"] = graphics.newImage(graphics.imagePath("Overdue/feet/FG_Too_Late_Luigi")),

            ["mouth bg"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_BG")),
            ["mouth fg close"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_CloseFG")),
            ["mouth bg far"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FarBG")),
            ["mouth bottom teeth"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FG_bottomteeth")),
            ["mouth top teeth"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FG_topteeth")),
            ["mouth string"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FG_string")),
            ["mouth fog"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Fog")),
            ["mouth inside"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Ground")),
            ["mouth pupil"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Pupil")),
            ["mouth sky"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Sky"))





        }


        stageImages["Stage Front"].y = 400
        stageImages["Curtains"].y = -100

        enemy = BaseCharacter("sprites/characters/daddy-dearest.lua")

        girlfriend.x, girlfriend.y = 30, -90
        enemy.x, enemy.y = -380, -110
        boyfriend.x, boyfriend.y = 260, 100
    end,

    load = function()

    end,

    update = function(self, dt)
    end,

    drawStreet = function(self)
        stageImages["street back trees"]:draw()
        stageImages["street front trees"]:draw()
        stageImages["street road"]:draw()
        stageImages["street car"]:draw()
    end,

    drawMouth = function(self)
    end,

    drawRunning = function(self)
    end,

    draw = function()
        love.graphics.push()
			love.graphics.translate(camera.x * 0.9, camera.y * 0.9)

			stageImages["Stage Back"]:draw()
			stageImages["Stage Front"]:draw()

			girlfriend:draw()
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x, camera.y)
			enemy:draw()
			boyfriend:draw()
            graphics.setColor(1,1,1)
            
		love.graphics.pop()
		love.graphics.push()
			love.graphics.translate(camera.x * 1.1, camera.y * 1.1)

			stageImages["Curtains"]:draw()
		love.graphics.pop()
    end,

    leave = function()
        for _, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}