--[[
-- f startuje v moměntě startu hry = inicializace všeho
]]
function love.load()
	button = {}
	button.x = 100
	button.y = 100
	button.size = 50

	score = 0
	timer = 5

	gameState = 1

	--width = love.graphics.getWidth()
	--height = love.graphics.getHeight()

	myFont = love.graphics.newFont(40)
end

--[[
-- @param dt: deltaTime
-- hodnota založena na framerate
]]
function love.update(dt)
	if gameState == 2 then
		if timer > 0 then
			timer = timer - dt
		else
			timer = 0
			gameState = 1
			score = 0
		end
	end
end

--[[
-- cokoliv, co hráč uvidí na obrazovce, je zde
]]
function love.draw()
	if gameState == 2 then
		love.graphics.setColor(255, 0, 0)
		love.graphics.circle("fill", button.x, button.y, button.size)
	end

	love.graphics.setFont(myFont)
	love.graphics.setColor(255, 255, 255)
	
	love.graphics.print("Score: " .. score)
	love.graphics.print("Time left: " .. math.ceil(timer), 300, 0)
	--love.graphics.print(width)
	--love.graphics.print(height)

	if gameState == 1 then
		love.graphics.printf("CLICK ANYWHERE FOR START!", 0, love.graphics.getHeight()/2, love.graphics.getWidth(), "center")
	end
end

function love.mousepressed(x, y, btn, istouch)
	if btn == 1 and gameState == 2 then
		if distanceBetween(button.x, button.y, love.mouse.getX(), love.mouse.getY()) < button.size then
			score = score + 1
			button.x = math.random(button.size, love.graphics.getWidth() - button.size)
			button.y = math.random(button.size, love.graphics.getHeight() - button.size)
		end	
	end

	if gameState == 1 then
		gameState = 2
		timer = 5
	end
end

function distanceBetween(x1, y1, x2, y2)
	return math.sqrt((y2 - y1)^2 + (x2-x1)^2)
end