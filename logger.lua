dofile('branch_miner/config.lua')

if not rednet.isOpen() then
  rednet.open('right')
end

function log_net(args)
  rednet.send(HOST_PORT, args)
end

function log_print(args)
  print(args)
end