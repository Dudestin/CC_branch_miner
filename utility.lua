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

function restore_pos(s)
  for k, v in s:iterate(true) do
    o_move_fn[v]()
  end
end

-- move turtle specified pos
function move_pos(dir)
  local function dig_until_empty()
    while not is_in_table(TRANSPARENT_BLOCK, turtle.inspect().name)
    do
      turtle.dig()
    end
  end
  
  local function digUp_until_empty()
    while not is_in_table(TRANSPARENT_BLOCK, turte.inspectUp().name)
    do
      turtle.digUp()
    end
  end
  
  local function digDown_until_empty()
    while not is_in_table(TRANSPARENT_BLOCK, turte.inspectDown().name)
    do
      turtle.digDown()
    end
  end  
  
  s = Stack:new()
  fn_table = {
    'forward'=function(s) dig_until_empty() move_fn['forward'](s) end,
    'back' = function(s) move_fn['back'](s) end,
    'up'   = function(s) digUp_until_empty() move_fn['up'](s) end,
    'down' = function(s) digDown_until_empty() move_fn['down'](s) end,
    'right'= function(s) move_fn['turnRight'](s) dig_until_empty() move_fn['forward'](s) end,
    'left' = function(s) move_fn['turnLeft'](s)  dig_until_empty() move_fn['forward'](s) end
  }
  assert(fn_table[dir], 'function move_pos() occurs an error, invalid arguments')
  fn_table[dir](s)
end

-- inspect specified pos
function inspect_pos(dir)
  s = Stack:new()
  fn_table = {
    'forward' = function(s) return turtle.inspect() end,
    'back' = function(s) move_fn['turnRight'](s) move_fn['turnRight'](s) return turtle.inspect() end,
    'up' = function(s) return turtle.inspectUp() end,
    'down' = function(s) return turtle.inspectDown() end,
    'right' = function(s) move_fn['turnRight'](s) return turtle.inspect() end,
    'left' = function(s) move_fn['turnLeft'](s) return turtle.inspect() end
  }
  assert(fn_table[dir], 'function inspect_dir() occurs an error, invalid arguments')
  r = fn_table[dir](s)
  restore_pos(s)
  return r
end
