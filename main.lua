require "settings"

function love.load()
  initSettings()
  checkForUpdate()
end

function love.draw()
  drawWindow()
  drawContents()
end

function love.update()
end
