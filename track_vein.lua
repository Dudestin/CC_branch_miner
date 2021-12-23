function make_tracklist(level)
  if level == 0 then
    return {'UP', 'DOWN', 'RIGHT', 'LEFT'}
  else 
    return {'FORWARD', 'UP', 'DOWN', 'RIGHT', 'LEFT'}
  end
end

function track_vein(level)
  for k, dir in pairs(make_tracklist(level)) do
    if is_in_table(NEED_TRACK, inspect_pos(dir).name) then --need to dig them ?
      move_stack = move(dir)
      track_vein(level + 1)  -- recursive call
      restore_pos(move_stack)
    end
  end
end