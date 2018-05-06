function drawWindow() --edit this function to change the way that the window looks

end

function drawContents()

  if newSize and upToDate == false then
    love.graphics.setColor(1,1,1)
    love.graphics.rectangle("line",100,100,300,16)
    info = love.filesystem.getInfo(product.file)
    love.graphics.rectangle("fill",100,100,(info.size/newSize)*300,16)
    love.graphics.print((round(info.size/1000000)).."mb / "..(round(newSize/1000000)).."mb downloaded")
    if round(info.size/10000) == round(newSize/10000) then upToDate = true end
  else
    love.graphics.print("Up to date!",100,100)
  end
end

--useful cuntions
function round(x)
  if x%2 ~= 0.5 then
    return math.floor(x+0.5)
  end
  return x-0.5
end

function isMouseOver(xpos, width, ypos, height)
  if cx > xpos and cx < xpos+width and cy > ypos and cy < ypos+height then
    return true
  else
    return false
  end
end
