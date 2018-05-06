--this file contains all of the launcher functions
http = require("socket.http")
upToDate = true

function checkForUpdate()
  local http = require("socket.http")
  local b, c, h = http.request(product.launchURL..product.version)
  love.filesystem.write(product.version, b)

  new = {}
  for line in love.filesystem.lines(product.version) do
    table.insert(new,line)
  end

  newSize = new[2]

  current = {}
  if love.filesystem.getInfo(product.title.."-launcher.txt") then --if the file exists
    for line in love.filesystem.lines(product.title.."-launcher.txt") do
      table.insert(current,line)
    end

    if current[1] ~= new[1] then --a new version is available
      startUpdate(new[1])
    end
  else
    startUpdate(new[1])
  end
end

function startUpdate(ver)
  download:start()
  upToDate = false
  love.filesystem.write(product.title.."-launcher.txt", ver)
  checkForUpdate()
end
