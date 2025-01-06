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

            ["transition bottom teeth"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FG_bottomteeth")),

            ["mouth top teeth"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FG_topteeth")),

            ["transition top teeth"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FG_topteeth2")),

            ["mouth string"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_FG_string")),
            ["mouth fog"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Fog")),
            ["mouth inside"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Ground")),
            ["mouth pupil"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Pupil")),
            ["mouth sky"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_Sky")),
            ["mouth bg med"] = graphics.newImage(graphics.imagePath("Overdue/meat/TL_Meat_MedBG"))

        }

        stageImages["transition bottom teeth"].x, stageImages["transition bottom teeth"].y = 342, 742
        stageImages["transition top teeth"].x, stageImages["transition top teeth"].y = 342, -996
        stageImages["transition top teeth"].sizeX, stageImages["transition top teeth"].sizeY = 0.5, 0.5

        stageImages["mouth bg"].x, stageImages["mouth bg"].y = 333, 2
        stageImages["mouth fg close"].x, stageImages["mouth fg close"].y = 333, 4
        stageImages["mouth bg far"].x, stageImages["mouth bg far"].y = 307, 60
        stageImages["mouth bg med"].x, stageImages["mouth bg med"].y = 307, 17
        stageImages["mouth bottom teeth"].x, stageImages["mouth bottom teeth"].y = 342, 506
        stageImages["mouth top teeth"].x, stageImages["mouth top teeth"].y = 345, -542
        stageImages["mouth top teeth"].sizeX, stageImages["mouth top teeth"].sizeY = 0.5,0.5
        stageImages["mouth sky"].x, stageImages["mouth sky"].y = 320, 21
        stageImages["mouth sky"].sizeX, stageImages["mouth sky"].sizeY = 2.1, 2.1
        stageImages["mouth fog"].x, stageImages["mouth fog"].y = 322, -11
        stageImages["mouth sky"].sizeX, stageImages["mouth sky"].sizeY = 2.5, 2.5
        stageImages["mouth string"].x, stageImages["mouth string"].y = 671, 0
        stageImages["mouth pupil"].x, stageImages["mouth pupil"].y = 291, -140

        enemy = BaseCharacter("sprites/Overdue/faker.lua")
        boyfriend = BaseCharacter("sprites/Overdue/picoCroutch.lua")


        picoCroutch = BaseCharacter("sprites/Overdue/picoCroutch.lua")
        picoStand = BaseCharacter("sprites/Overdue/picoStand.lua")
        faker = BaseCharacter("sprites/Overdue/faker.lua")
        realer = BaseCharacter("sprites/Overdue/realer.lua")

        picoSpeak = love.filesystem.load("sprites/Overdue/picoSpeak.lua")()

        characterPositions = {
            street = { 
                enemy = {x = -1172, y = 222, sizeX = 1, sizeY = 1},
                boyfriend = {x = 700, y = 23, sizeX = 1, sizeY = 1}
            },
            mouth = {
                boyfriend = {x = 536, y = 279, sizeX = 0.5, sizeY = 0.5},
                enemy = {x = -35, y = 194, sizeX = 0.5, sizeY = 0.5}
            }
        }

        girlfriend.x, girlfriend.y = 30, -90
        enemy.x, enemy.y = -1172, 222
        boyfriend.x, boyfriend.y = 700, 23

        enemy = faker
        boyfriend = picoCroutch

        picoSpeak.x, picoSpeak.y = boyfriend.x, boyfriend.y

        stageMode = "street"

    end,

    closeTeeth = function(self)
        didTeethThingy = true
        local returnXbottom, returnYbottom = stageImages["transition bottom teeth"].x, stageImages["transition bottom teeth"].y
        local returnXtop, returnYtop = stageImages["transition top teeth"].x, stageImages["transition top teeth"].y

        local closeTime = 0.3
        local waitTime = 0.3
        local openTime = 0.3

        Timer.tween(closeTime, stageImages["transition top teeth"], {y = -486}, "in-quad")
        Timer.tween(closeTime, stageImages["transition bottom teeth"], {y = 113}, "in-quad", function()
            stageMode = "mouth"
            Timer.after(waitTime, function()
                Timer.tween(openTime, stageImages["transition top teeth"], {y = returnYtop}, "in-quad")
                Timer.tween(openTime, stageImages["transition bottom teeth"], {y = returnYbottom}, "in-quad")
            end)
        end)

    end,

    load = function()
        didTeethThingy = false

        musicTime = 74634


    end,

    update = function(self, dt)
        if musicTime >= 84634 and not didTeethThingy then
            self:closeTeeth()
        end

    end,

    drawStreet = function(self)
        love.graphics.push()

            love.graphics.push()
                love.graphics.translate(camera.x * 0.9, camera.y * 0.9)
                stageImages["street back trees"]:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x, camera.y)
                stageImages["street front trees"]:draw()
                stageImages["street road"]:draw()
                stageImages["street car"]:draw()
                enemy:draw()
                if picoSpeak:isAnimated() then 
                    picoSpeak:draw()
                else
                    boyfriend:draw()
                end
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*1.1,camera.y*1.1)
                stageImages["transition bottom teeth"]:draw()
                stageImages["transition top teeth"]:draw()
            love.graphics.pop()

        love.graphics.pop()
    end,

    drawMouth = function(self)
        love.graphics.push()

            love.graphics.push()
                love.graphics.translate(camera.x*0.7,camera.y*0.7)
                stageImages["mouth sky"]:draw()
                stageImages["mouth bg far"]:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*0.8,camera.y*0.8)
                stageImages["mouth bg med"]:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*0.9, camera.y*0.9)
                stageImages["mouth bg"]:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x,camera.y)
                stageImages["mouth inside"]:draw()
                stageImages["mouth pupil"]:draw()
              --  boyfriend:draw()
               -- enemy:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*1.1,camera.y*1.1)
                stageImages["mouth string"]:draw()
                stageImages["transition bottom teeth"]:draw()
                stageImages["mouth top teeth"]:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*1.1,camera.y*1.1)
                stageImages["transition top teeth"]:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*1.2,camera.y*1.2)
                    stageImages["mouth fg close"]:draw()
                    stageImages["mouth fog"]:draw()
            love.graphics.pop()

        love.graphics.pop()


    end,

    drawRunning = function(self)
    end,

    draw = function(self)
        if stageMode == "street" then

            self.drawStreet()
        end

        if stageMode == "mouth" then
            self.drawMouth()
        end
    end,

    leave = function()
        for _, v in pairs(stageImages) do
            v = nil
		end

        graphics.clearCache()
    end
}