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
  if (dir == 'forward') then
    r = turtle.inspect()
  elseif (dir == 'back') then
    turtle.turnRight()
    turtle.turnRight()
    r = turtle.inspect()
    turtle.turnLeft()
    turtle.turnLeft()
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
  up = turtle.up(),
  down = turtle.down(),
  turnLeft = turtle.turnLeft(),
  turnRight = turtle.turnRight(),
  forward = turtle.forward(),
  back = turtle.back()
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

-- move turtle specify direction 
function move_dir(dir)
  s = Stack.new()
  if (dir == 'forward') then
    dig_until_empty()
    turtle.forward()
    s:push('forward')
  elseif (dir == 'back') then
    turtle.back()
    s:push('back')
  elseif (dir == 'up') then
    
end