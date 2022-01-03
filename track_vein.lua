あとは普通にローカルcommitしてmasterにpushすれば反映されます。 master以外のremote branchを作った場合はブラウdofile('branch_miner/utility.lua')
dofile('branch_miner/config.lua')

function make_tracklist(level)
  if level == 0 then
    return {'UP', 'DOWN', 'RIGHT', 'LEFT'}
  else 
    return {'FORWARD', 'UP', 'DOWN', 'RIGHT', 'LEFT'}
  end
end

function track_vein(level)
  for k, dir in pairs(make_tracklist(level)) do
    if is_in_table(WANT_BLOCK_ID, inspect_pos(dir).name) then --need to dig them ?
      local move_stack = move_pos(dir)
      track_vein(level + 1)  -- recursive call
      restore_pos(move_stack)
    end
  end
end