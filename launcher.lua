--this file contains all of the launcher functions
function checkForUpdate()

  local http = require("socket.http")
  local b, c, h = http.request(product.launchURL..product.version)
  love.filesystem.write(product.version, b)

  new = {}
  for line in love.filesystem.lines(product.version) do
    table.insert(new,line)
  end

  current = {}
  if love.filesystem.getInfo(product.title.."-launcher.txt") then --if the file exists
    for line in love.filesystem.lines(product.title.."-launcher.txt") do
      table.insert(current,line)
    end

    if current[1] ~= new[1] then --a new version is available
      startUpdate()
    end
  else
    startUpdate()
  end
end

function startUpdate()

end
