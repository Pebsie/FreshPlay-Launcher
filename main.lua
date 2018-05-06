require "settings"
require "launcher"
require "ui"
require "download"

function love.load()
  download = love.thread.newThread(dc)
  initSettings()
  checkForUpdate()
end

function love.draw()
  drawWindow()
  drawContents()
end

function love.update()
end
