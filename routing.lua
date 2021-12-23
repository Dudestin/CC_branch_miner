-- define base_mine
function route_base_mine
  for i = 1, RT_PARAM[L] then
    track_vein(0)
    turtle.dig_until_empty()
    turtle.forward()
  end
