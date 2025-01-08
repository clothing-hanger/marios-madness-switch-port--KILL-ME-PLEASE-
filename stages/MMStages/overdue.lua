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
        realer:animate("LuigiTransformation", true)

        picoSpeak = love.filesystem.load("sprites/Overdue/picoSpeak.lua")()

        characterPositions = {
            street = { 
                enemyFaker = {x = -1172, y = 201, sizeX = 1, sizeY = 1, camX = 563, camY = 32, camZoom = 0.7},
                enemyRealer = {x = -761, y = 26, sizeX = 1, sizeY = 1, camX = 563, camY = 32, camZoom = 1},

                picoCroutch = {x = 700, y = 23, sizeX = 1, sizeY = 1, camX = -492, camY = -133, camZoom = 0.5},
                center = {camX = -313, camY = -45, camZoom = 0.45}
            },
            mouth = {
                boyfriend = {x = 511, y = 350, sizeX = 0.5, sizeY = 0.5, camX = -431, -181, camZoom = 0.8},
                enemy = {x = -35, y = 194, sizeX = 0.5, sizeY = 0.5, camX = -164, camY = 201, camZoom = 0.7}
            }
        }

        pupilPositions = {
            enemy = {x = 272, y = -140},
            boyfriend = {x = 321, -140}
        }

        
        enemy = faker
        boyfriend = picoCroutch

        realer.x, realer.y = characterPositions.street.enemyRealer.x, characterPositions.street.enemyRealer.y

        girlfriend.x, girlfriend.y = 30, -90
        enemy.x, enemy.y = characterPositions.street.enemyFaker.x, characterPositions.street.enemyFaker.y
        boyfriend.x, boyfriend.y = characterPositions.street.picoCroutch.x, characterPositions.street.picoCroutch.y


        picoSpeak.x, picoSpeak.y = boyfriend.x, boyfriend.y
        picoStand.x, picoStand.y = boyfriend.x, boyfriend.y


        stageMode = "street"

        camera:addPoint("enemy", characterPositions.street.enemyFaker.camX, characterPositions.street.enemyFaker.camY)  --1
        camera:addPoint("boyfriend", characterPositions.street.picoCroutch.camX, characterPositions.street.picoCroutch.camY)    --0.9
        camera:addPoint("center", characterPositions.street.center.camX, characterPositions.street.center.camY)


        enemyZoom = characterPositions.street.enemyFaker.camZoom
        boyfriendZoom = characterPositions.street.picoCroutch.camZoom

    end,

    switchStageMode = function(self, mode)
        if mode == "mouth" then
            boyfriend.x, boyfriend.y = characterPositions.mouth.boyfriend.x, characterPositions.mouth.boyfriend.y
            boyfriend.sizeX, boyfriend.sizeY = characterPositions.mouth.boyfriend.sizeX, characterPositions.mouth.boyfriend.sizeY

            enemy.x, enemy.y = characterPositions.mouth.enemy.x, characterPositions.mouth.enemy.y
            enemy.sizeX, enemy.sizeY = characterPositions.mouth.enemy.sizeX, characterPositions.mouth.enemy.sizeY

        end
        stageMode = mode
    end,

    closeTeeth = function(self)
        didTeethThingy = true
        doingTeethThingy = true
        local returnXbottom, returnYbottom = stageImages["transition bottom teeth"].x, stageImages["transition bottom teeth"].y
        local returnXtop, returnYtop = stageImages["transition top teeth"].x, stageImages["transition top teeth"].y

        local closeTime = 0.15
        local waitTime = 0.3
        local openTime = 0.3
        --camera.zoom = camera.zoom+0.4

        Timer.tween(closeTime, stageImages["transition top teeth"], {y = -486}, "in-quad")
        Timer.tween(1.5, camera, {zoom = camera.zoom+4})
        Timer.tween(closeTime, stageImages["transition bottom teeth"], {y = 113}, "in-quad", function()
            self:switchStageMode("mouth")
            Timer.after(waitTime, function()
                Timer.tween(openTime, stageImages["transition top teeth"], {y = returnYtop}, "in-quad")
                Timer.tween(openTime, stageImages["transition bottom teeth"], {y = returnYbottom}, "out-quad", function() doingTeethThingy = false; camera.lockedMoving = false end)
                enemyZoom = 1
               -- Timer.tween(openTime, camera, {zoom = camera.zoom-0.5})

                
            end)
        end) 

    end,

    load = function()
        didTeethThingy = false
        musicTime = 74634
    end,


    update = function(self, dt)
        realer.x = stageImages["mouth pupil"].x
        realer.y = stageImages["mouth pupil"].y
        picoSpeak:update(dt)
        --print(camera.mustHit)

        --realer:update(dt)


        if checkMusicTime(20210) then camera:moveToPoint(0.1, "enemy"); camera.lockedMoving = true end
        if checkMusicTime(21300) and enemy:getAnimName() ~= "LuigiTransformation" then enemy:animate("LuigiTransformation", false); enemy.x, enemy.y = characterPositions.street.enemyRealer.x, characterPositions.street.enemyRealer.y end
        if checkMusicTime(24000) and enemy ~= realer then enemy = realer end
        if checkMusicTime(22398) then camera.lockedMoving = false; enemyZoom = characterPositions.street.enemyRealer.camZoom end
        if checkMusicTime(21473) and not picoSpeak:isAnimated() then picoSpeak:animate("one", false, function() boyfriend = picoStand end) end
        if checkMusicTime(42947) and not picoSpeak:isAnimated() then picoSpeak:animate("two", false) --[[camera.lockedMoving = true]] end
        if checkMusicTime(84315) and not camera.lockedMoving then camera:moveToPoint(0.5, "center"); camera.lockedMoving = true end
        if checkMusicTime(84434) and not didTeethThingy then self:closeTeeth() end

        --[

        if pupilTimer then Timer.cancel(pupilTimer) end
        if camera:getCurrentPoint() == "enemy" then 
            pupilTimer = Timer.tween(1, stageImages["mouth pupil"], {x = pupilPositions.enemy.x})
        elseif camera:getCurrentPoint() == "boyfriend" then
            pupilTimer = Timer.tween(1, stageImages["mouth pupil"], {x = pupilPositions.boyfriend.x})
        end
        
--]]
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
                --realer:draw()
                if picoSpeak:isAnimated() then 
                    picoSpeak:draw()
                else
                    boyfriend:draw()
                end
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*1.1,camera.y*1.1)
                if doingTeethThingy then
                    stageImages["transition bottom teeth"]:draw()
                    stageImages["transition top teeth"]:draw()
                end
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
                boyfriend:draw()
                realer:draw()
            love.graphics.pop()

            love.graphics.push()
                love.graphics.translate(camera.x*1.1,camera.y*1.1)
                stageImages["mouth string"]:draw()
                stageImages["transition bottom teeth"]:draw()
                if doingTeethThingy then stageImages["mouth top teeth"]:draw() end
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