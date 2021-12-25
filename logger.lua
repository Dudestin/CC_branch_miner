dofile('branch_miner/config.lua')

if rednet.isOpen() then
  rednet.close()
end

rednet.open('right')

function log_net(args)
  rednet.send(HOST_PORT, args)
end

function log_print(args)
  print(args)
end