dofile('branch_miner/utility.lua')
dofile('branch_miner/config.lua')

function put_rail()
  for i=1, 16 do 
    if (turtle.getItemDetail(i).name == name) then
      coroutine.yield(i)
    end
  end
end

function put_powered_rail()
  digDown_until_empty() -- height : 2
  turtle.down() -- height : 1
  digDown_until_empty() -- height : 1
  turtle.down()
  digDown_until_empty() --height : -1
  turtle.
end