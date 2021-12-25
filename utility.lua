Stack = dofile('branch_miner/stack.lua')
dofile('branch_miner/config.lua')

-- inventory iterator
-- return match name slot id
-- usage : for k,v in coroutine.wrap(inv_iter(hoge))
function inv_iter(name)
  for i=1, 16 do 
    if (turtle.getItemDetail(i).name == name) then
      coroutine.yield(i)
    end
  end
end

function is_in_table(table, value)
  for k, v in pairs(table) do
    if v == value then
      return true
    end
  end
  return false
end

-- move function table
move_fn = {
  up = function(stack) turtle.up() stack:push('up')  return stack end,
  down = function(stack) turtle.down() stack:push('down') return stack end,
  turnLeft = function(stack) turtle.turnLeft() stack:push('turnLeft') return stack end,
  turnRight = function(stack) turtle.turnRight() stack:push('turnRight') return stack end,
  forward = function(stack) turtle.forward() stack:push('forward') return stack end,
  back = function(stack) turtle.back() stack:push('back') return stack end
}

-- opposite move function table
o_move_fn = {
  up = function() turtle.down() end,
  down = function() turtle.up() end,
  turnLeft = function() turtle.turnRight() end,
  turnRight = function() turtle.turnLeft() end,
  forward = function() turtle.back() end,
  back = function() turtle.forward() end
}

function restore_pos(s)
  for k, v in s:iterate(true) do
    o_move_fn[v]()
  end
end

function dig_until_empty()
  while not(is_in_table(TRANSPARENT_BLOCK_ID, inspect_pos('FORWARD').name)) do
    turtle.dig()
  end
end

function digUp_until_empty()
  while not(is_in_table(TRANSPARENT_BLOCK_ID, inspect_pos('UP').name)) do
    turtle.digUp()
  end
end

function digDown_until_empty()
  while not(is_in_table(TRANSPARENT_BLOCK_ID, inspect_pos('DOWN').name)) do
    turtle.digDown()
  end
end  

-- move turtle specified pos
function move_pos(dir)  
  local s = Stack:new()
  local fn_table = {
    FORWARD = function(s) dig_until_empty() return move_fn['forward'](s) end,
    BACK = function(s) return move_fn['back'](s) end,
    UP   = function(s) digUp_until_empty() return move_fn['up'](s) end,
    DOWN = function(s) digDown_until_empty() return move_fn['down'](s) end,
    RIGHT= function(s) local s = move_fn['turnRight'](s) dig_until_empty() return move_fn['forward'](s) end,
    LEFT = function(s) local s = move_fn['turnLeft'](s)  dig_until_empty() return move_fn['forward'](s) end
  }
  assert(fn_table[dir], 'function move_pos() occurs an error, invalid arguments')
  return fn_table[dir](s)
end

-- inspect specified pos
function inspect_pos(dir)
  local s = Stack:new()
  local fn_table = {
    FORWARD = function(s) return s, turtle.inspect() end,
    BACK = function(s) local s = move_fn['turnRight'](s) return move_fn['turnRight'](s), turtle.inspect() end,
    UP   = function(s) return s, turtle.inspectUp() end,
    DOWN = function(s) return s, turtle.inspectDown() end,
    RIGHT= function(s) return move_fn['turnRight'](s), turtle.inspect() end,
    LEFT = function(s) return move_fn['turnLeft'](s),  turtle.inspect() end
  }
  assert(fn_table[dir], 'function inspect_dir() occurs an error, invalid arguments')
  local s, r1, r2 = fn_table[dir](s)
  restore_pos(s)
  if r1 then
    return r2
  end
  return {name = "NO_BLOCK"}
end

function drop_trash()
  for i=1, 16 do
    turtle.select(i)
    if turtle.getItemDetail() then
      if not(is_in_table(WANT_ITEM_ID, turtle.getItemDetail().name)) then -- if "trash"
        turtle.drop()
      end
    end
  end
end

function try_refuel()
  for i=1, 16 do 
    if turtle.getFuelLevel() >= REFUEL_THRESHOLD then
      break
    end
    turtle.select(i)
    if turtle.getItemDetail() then
      if is_in_table(FUEL_ITEM_ID, turtle.getItemDetail().name) then
        turtle.refuel()
      end
    end
  end
end

function unload_cargo()
  for i=1, 16 do
    turtle.select(i)
    if turtle.getItemDetail() then
      turtle.dropDown(i)
    end
  end
end

function forward_N(count)
  for i=1, count do
    dig_until_empty()
    turtle.forward(i)
  end
end