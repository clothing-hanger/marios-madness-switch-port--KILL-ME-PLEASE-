--[[----------------------------------------------------------------------------
This file is part of Friday Night Funkin' Rewritten

Copyright (C) 2021  HTV04

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
local events = {
	["Triggers Universal"] = {
		func = function(value1, value2)
		--	print("I DONT FUCKING KNOW WHAT THIS IS SUPPOSED TO DO IT HAS A STUPID ASS NAME")
		end
	},
	["Play Animation"] = {
		func = function(value1, value2)
			--if value2 == "boyfriend" or value1 == 0 then boyfriend:animate(value1) end
		--	if value2 == "dad" or value1 == 1 then enemy:animate(value1) end
			--if value2 == "girlfriend" or value1 == 2 then girlfriend:animate(value1) end

			if value1 == "Hey" then enemy:animate("LuigiLaugh", false) end 
		end
	},
	["Add Subtitle"] = {
		func = function(value1, value2)
			subtitle = value1
		end
	},
	["Change Character"] = {
		func = function(value1, value2)
		--	if value1 == "BF" or value1 == 0 then
			--	boyfriend = value2
			--elseif value1 == "Dad" or value1 == 1 then
			--	enemy = value2
			--elseif value1 == "GF" or value1 == 2 then
			--	girlfriend = value2 -- prob wont be used (i HATE women)
			--
		end,
		func = function(value1, value2)
			
			--print(value1)
			--print(value2)
		end
	},
	["Show Song"] = {
		func = function(value1, value2)
			print("penis cock 2")

		end
	},
	["Add Camera Zoom"] = {
		func = function(value1, value2)
			if type(value1) ~= "number" then camera.zoom = (camera.zoom + 0.015) else camera.zoom = (camera.zoom + value1) end
		end 
	},
	["Set Cam Zoom"] = {
		func = function(value1, value2)
			camera.defaultZoom = value1
		end
	},
	["Screen Shake"] = {
		func = function(value1, value2)
			print("imagine joe biden shaking his ass :drool: :drool: :drool:")
		end
	},
}
local stage
local subtitle

return {
	enter = function(self, from, songNum, songAppend, _songExt, _audioAppend)
		
		weeks:enter()

		stage = stages["overdue.base"]

		stage:enter(_songExt)

		song = songNum
		difficulty = songAppend 
		songExt = _songExt
		audioAppend = _audioAppend

		self:load()
	end,



	onEvent = function(self, event)

		local eventName = event.name
		local value1 = event.value1
		local value2 = event.value2

		print("EVENT: " .. eventName .. " VALUE1: " .. value1 .. " VALUE2: " .. value2)
		for name, eventThingy in pairs(events) do
			if eventName == name then eventThingy.func(value1, value2) end
		end
	end,

	onCameraEvent = function(self, value)
		if camZoomTween then Timer.cancel(camZoomTween) end

		print("ONCAMERAEVENT")
		local type = type(value)
		if type == "number" then
			local value = value
			if value == 0 then
				print("ENEMY ZOOM")
				local newCamSize = enemyZoom
				camera.defaultZoom = newCamSize
				--camZoomTween = Timer.tween(1, camera, {defaultZoom = newCamSize})
			elseif value == 1 then
				print("BOYFRIEND ZOOM")
				local newCamSize = boyfriendZoom
				camera.defaultZoom = newCamSize

				--camZoomTween = Timer.tween(1, camera, {defaultZoom = newCamSize})
			end
		elseif type == "table" then
			local value = tonumber(value.char)
			if value == 0 then
				print("ENEMY ZOOM")
				local newCamSize = enemyZoom
				camera.defaultZoom = newCamSize


				--camZoomTween = Timer.tween(1, camera, {defaultZoom = newCamSize})
			elseif value == 1 then
				print("BOYFRIEND ZOOM")
				local newCamSize = boyfriendZoom
				camera.defaultZoom = newCamSize

				--camZoomTween = Timer.tween(1, camera, {defaultZoom = newCamSize})
			end
		end
		
	end,

	load = function(self)
		weeks:load()
		stage:load()


			inst = love.audio.newSource("songs/Overdue/Inst.ogg", "stream")
			voicesBF = love.audio.newSource("songs/Overdue/Voices.ogg", "stream")


		self:initUI()

		weeks:setupCountdown()
	end,



	initUI = function(self)
		weeks:initUI()

			weeks:legacyGenerateNotes("songs/Overdue/Overdue.json")
			weeks:generatePsychEvents("songs/Overdue/Overdue.json")
		
	end,

	update = function(self, dt)
		weeks:update(dt)
		stage:update(dt)

		weeks:checkSongOver()

		weeks:updateUI(dt)


	end,

	draw = function(self)
		love.graphics.push()
			love.graphics.translate(graphics.getWidth() / 2, graphics.getHeight() / 2)
			love.graphics.scale(camera.zoom, camera.zoom)

			stage:draw()
		love.graphics.pop()

		weeks:drawUI()
	end,

	leave = function(self)
		stage:leave()

		enemy = nil
		boyfriend = nil
		girlfriend = nil

		graphics.clearCache()

		weeks:leave()
	end
}
