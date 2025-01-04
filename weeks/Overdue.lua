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

local stage

return {
	enter = function(self, from, songNum, songAppend, _songExt, _audioAppend)
		print("COCKCOCK")
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
		for i = 1,#event.events do
			local eventName = event.events[j][1]
			local value1 = event.events[j][2]
			local value2 = event.events[j][3]
			print(eventName .. "  " .. value1 .. "  " .. value2)
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
