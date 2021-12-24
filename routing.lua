dofile('branch_miner/utility.lua')
dofile('branch_miner/track_vein.lua')
dofile('branch_miner/config.lua')

-- define mine routing
function route_mine()
  local function route_line(len)
    for i=1, len do
      if (i % 20 == 0) then
        try_refuel()
        drop_trash()
      end
      dig_until_empty()
      turtle.forward()
      track_vein(0)
    end
  end
  
  route_line(RT_PARAM['L']) -- outbound
  turtle.turnRight()
  route_line(RT_PARAM['W'] + 2)
  turtle.turnRight()
  route_line(RT_PARAM['L']) -- inbound
end