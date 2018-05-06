bFont = love.graphics.newFont(32)
sFont = love.graphics.newFont(12)

function drawWindow() --edit this function to change the way that the window looks
  love.graphics.setColor(0.23,0.67,0.85)
  love.graphics.setLineWidth(8)
  love.graphics.rectangle("line",0,0,600,400)
  love.graphics.setLineWidth(1)

  if isMouseOver(0,0,16,16) then
    love.graphics.setColor(1,0,0)
  else
    love.graphics.setColor(0.75,0,0)
  end
  love.graphics.rectangle("fill",0,0,16,16)
end

function drawContents()
  love.graphics.setColor(1,1,1)
  love.graphics.draw(fpLogo,600/2-(fpLogo:getWidth()/2))

  love.graphics.setColor(0.23,0.67,0.85)
  love.graphics.setFont(bFont)
  if not upToDate then --x,y,width,height,text
    drawProgressBar(20,300,560,80,false)
  else
    drawLaunchButton(20,300,560,80) --if you change these values make sure that you change them in the love.mousepressed event too!
  end

  love.graphics.setColor(0,0,0)
  love.graphics.setFont(sFont)
  love.graphics.printf(news,40,100,520,"center")

  attributeFP() --removing this line is a breach of the license
end

function drawProgressBar(x,y,width,height,text)
  if newSize and upToDate == false then
    love.graphics.rectangle("line",x,y,width,height)
    info = love.filesystem.getInfo(product.file)
    love.graphics.rectangle("fill",x,y,(info.size/newSize)*width,height)
    --if text then love.graphics.print((round(info.size/1000000)).."mb / "..(round(newSize/1000000)).."mb downloaded",x,y+height) end
    if round(info.size/10000) == round(newSize/10000) then upToDate = true end
  elseif upToDate == true then
    return false
  else
    love.graphics.rectangle("line",x,y,width,height)
  end
end

function drawLaunchButton(x,y,width,height)
  if isMouseOver(x,y,width,height) then
    love.graphics.setColor(0.13,0.57,0.75)
  else
    love.graphics.setColor(0.23,0.67,0.85)
  end

  love.graphics.rectangle("fill",x,y,width,height)

  love.graphics.setColor(1,1,1)
  love.graphics.printf("Launch Game",x,y+(height/2)-(bFont:getHeight()/2),width,"center")
end

function love.mousepressed(x,y)
  if isMouseOver(0,0,16,16) then
    love.event.quit()
  elseif isMouseOver(20,300,560,80) then
    love.window.showMessageBox("Opening file","file://"..love.filesystem.getSaveDirectory().."/"..product.file)
    love.system.openURL("file://"..love.filesystem.getSaveDirectory().."/"..product.file)
  end
end

--useful funtions
function round(x)
  if x%2 ~= 0.5 then
    return math.floor(x+0.5)
  end
  return x-0.5
end

function isMouseOver(xpos, ypos, width, height)
  local cx, cy = love.mouse.getPosition()
  if cx > xpos and cx < xpos+width and cy > ypos and cy < ypos+height then
    return true
  else
    return false
  end
end

function attributeFP()
  love.graphics.setColor(0,0,0)
  love.graphics.printf("FreshPlay Launcher (http://freshplay.co.uk)",0,380,600,"center")
end
