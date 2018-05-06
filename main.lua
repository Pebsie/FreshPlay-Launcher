require "settings"
require "launcher"
require "ui"
require "download"

function love.load()
  download = love.thread.newThread(dc)
  initSettings()
  local b, c, h = http.request(product.launchURL..product.news)
  news = b

  checkForUpdate()

  fpLogo = love.graphics.newImage("img/freshplay-logo.png")

  love.graphics.setBackgroundColor(1,1,1)
end

function love.draw()
  drawWindow()
  drawContents()
end

function love.update()
end
