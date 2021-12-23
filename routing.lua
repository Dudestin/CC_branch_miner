dofile('branch_miner/utility.lua')
dofile('branch_miner/track_vein.lua')
dofile('branch_miner/config.lua')

-- define mine routing
function route_mine()
  local function route_line(len)
    for i=1, len do
      dig_until_empty()
      turtle.forward()
      track_vein(0)
    end
  end
  route_line(RT_PARAM['L'])
  turtle.turnRight()
  route_line(RT_PARAM['W'] + 2)
  turtle.turnRight()
  route_line(RT_PARAM['L'])
end