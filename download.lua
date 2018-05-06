dc = [[
require("love.filesystem")
require "settings"

initSettings()

love.filesystem.setIdentity(product.title.."-launcher")

success = love.filesystem.remove( product.file )

f = love.filesystem.newFile(product.file)
f:open('a')

local http = require("socket.http")
local b, c, h = http.request{
  url = product.launchURL..product.file,
  sink = function(chunk, err)
    if chunk then
      f:write(chunk)
    end
    return 1
  end
}

f:close()]]
