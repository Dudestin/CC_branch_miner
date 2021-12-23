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


-- inspect specify direction
function inspect_dir(dir)
  s = Stack:new()
  if (dir == 'forward') then
    r = turtle.inspect()
  elseif (dir == 'back') then
    move_fn['right'](s)
    move_fn['right'](s)
    r = turtle.inspect()
    restore_pos(s)
  elseif (dir == 'up') then
    r = turtle.inspectUp()
  elseif (dir == 'down') then
    r = turtle.inspectDown()
  elseif (dir == 'right') then
    turtle.turnRight()
    r = turtle.inspect()
    turtle.turnLeft()
  elseif (dir == 'left') then
    turtle.turnLeft()
    r = turtle.inspect()
    turtle.turnRight()
  else
    error("utility.lua : function inspect(direction) get invalid argument.")
  end
  return r
end

-- move function table
move_fn = {
  up = function(stack) turtle.up() stack:push('up') end,
  down = function(stack) turtle.down() stack:push('down') end,
  turnLeft = function(stack) turtle.turnLeft() stack:push('turnLeft') end,
  turnRight = function(stack) turtle.turnRight() stack:push('turnRight') end,
  forward = function(stack) turtle.forward() stack:push('forward') end,
  back = function(stack) turtle.back() stack:push('back') end
}

-- opposite move function table
o_move_fn = {
  up = turtle.down(),
  down = turtle.up(),
  turnLeft = turtle.turnRight(),
  turnRight = turtle.turnLeft(),
  forward = turtle.back(),
  back = turtle.forward()
}

inspect_fn = {
  up = function(stack) turtle.  
  
}

function restore_pos(s)
  for i in stack.iterate(true) do
    o_move_fn[i]()
  end
end

-- move turtle specify direction 
function move_dir(dir)
  local function dig_until_empty()
    while not is_in_table(FLUID_BLOCK, turtle.inspect().name)
    do
      turtle.dig()
    end
  end
  
  local function digUp_until_empty()
    while not is_in_table(FLUID_BLOCK, turte.inspectUp().name)
    do
      turtle.digUp()
    end
  end
  
  local function digDown_until_empty()
    while not is_in_table(FLUID_BLOCK, turte.inspectDown().name)
    do
      turtle.digDown()
    end
  end  
  
  s = Stack.new()
  
  if (dir == 'forward') then
    dig_until_empty()
    move_fn[dir](s)
  elseif (dir == 'back') then
    move_fn[dir](s)
  elseif (dir == 'up') then
    digUp_until_empty()
    move_fn[dir](s)
  elseif (dir == 'down') then
    digDown_until_empty()
    move_fn[dir](s)
  elseif (dir == 'right') then
    move_fn['right'](s)
    turtle.dig_until_empty()
    move_fn['forward'](s)
  elseif (dir == 'left') then
    move_fn['left'](s)
    turtle.dig_until_empty()
    move_fn['forward'](s)
  end
  return s
end