-- define mine routing
function route_mine()
  local function route_line(len)
    for i=1, len then
      turtle.dig_until_empty()
      turtle.forward()
      track_vein(0)
    end
  end
  route_mine(RT_PARAM[L])
  turtle.turnRight()
  route_mine(RT_PARAM[W+2])
  turtle.turnRight()
  route_mine(RT_PARAM[L])
end