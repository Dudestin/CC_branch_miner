dofile('branch_miner/routing.lua')
dofile('branch_miner/logger.lua')

-- set parameters if specified 
if arg[1] then
  RT_PARAM.L = arg[1]
  RT_PARAM.W = arg[2]
  RT_PARAM.N = arg[3]
  RT_PARAM.OFFSET = arg[4]
end

-- main routine
log_net("Start Auto Branch-Mining")
route_main_mine()