dofile('branch_miner/utility.lua')
dofile('branch_miner/track_vein.lua')
dofile('branch_miner/config.lua')
dofile('branch_miner/logger.lua')

-- define side-mine routing
function route_side_mine()
  local function route_line(len)
    for i=1, len do
      log_net('now line-mining at ' .. i ..  '/' .. len)
      dig_until_empty()
      turtle.forward()
      track_vein(0)
      drop_trash()
    end
  end
  
  route_line(RT_PARAM['L']) -- outbound
  turtle.turnRight()
  route_line(RT_PARAM['W'] + 1)
  turtle.turnRight()
  route_line(RT_PARAM['L']) -- inbound
end

-- define base-mine routing 
function route_base_mine()
  for i=RT_PARAM['OFFSET'], RT_PARAM['N']-1 do
    turtle.select(1)
    log_net("mining " .. i .. 'th' .. 'side-mine')
    local row = math.floor(i / 2) + 1
    local outer_pos = row * 6 -- departure position
    local inner_pos = outer_pos - 3 -- arrival position
    
    if (i % 2 == 0) then -- right-side
      forward_N(outer_pos)
      turtle.turnRight()
      route_side_mine()
      turtle.turnLeft()
      forward_N(inner_pos)
    else -- left-side
      forward_N(inner_pos)
      turtle.turnLeft()
      route_side_mine()
      turtle.turnRight()
      forward_N(outer_pos)
    end
    
    -- unload all items 
    log_net('finished sub-mine mining')
    try_refuel()
    unload_cargo()
    
    turtle.turnRight()
    turtle.turnRight()
  end
end
