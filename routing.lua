dofile('branch_miner/utility.lua')
dofile('branch_miner/track_vein.lua')
dofile('branch_miner/config.lua')
dofile('branch_miner/logger.lua')

-- define side-mine routing
function route_side_mine()
  local function route_line(len)
    for i=1, len do
      if (i % 20 == 0) then
        try_refuel()
        drop_trash()
      end
      log_net('now line-mining at ' .. i ..  '/' .. len)
      dig_until_empty()
      turtle.forward()
      track_vein(0)
    end
  end
  
  route_line(RT_PARAM['L']) -- outbound
  turtle.turnRight()
  route_line(RT_PARAM['W'] + 1)
  turtle.turnRight()
  route_line(RT_PARAM['L']) -- inbound
end

-- define main-mine routing 
function route_main_mine()
  for i=RT_PARAM['OFFSET'], RT_PARAM['N']-1 do
    turtle.select(1)
    log_net("mining " .. i .. 'th' .. 'side-mine')
    local row = math.floor(i / 2) + 1
    local outer_pos = row * 6 -- dept. position
    local inner_pos = outer_pos - 3 -- arrival position
    
    if (i % 2 == 0) then -- right-side
      forward_N(outer_pos)
      -- palace chunk loader
      turtle.select(CHUNK_LOADER_SLOT)  -- 16 : chunk loader slot
      turtle.digDown()
      turtle.placeDown() -- place chunk loader
      turtle.select(1)
      turtle.turnRight()
      route_side_mine()
      turtle.turnLeft()
      -- dig & get chunk loader
      forward_N(6)
      turtle.select(CHUNK_LOADER_SLOT)
      turtle.digDown() -- get chunk loader
      forward_N(inner_pos - 6)
    else -- left-side
      forward_N(inner_pos)
      turtle.turnLeft()
      route_side_mine()
      turtle.turnRight()
      forward_N(outer_pos)
    end
    
    -- unload all items 
    log_net('finished sub-mine mining')
    unload_cargo()
    redstone.setOutput('bottom', true) 
    sleep(1)
    redstone.setOutput('bottom', false)
    
    turtle.turnRight()
    turtle.turnRight()
  end
end