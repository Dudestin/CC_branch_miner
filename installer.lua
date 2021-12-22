-- Script for downloading CC_branch_miner program

if fs.exists("/branch_miner") then
  if not fs.isDir("/branch_miner") or fs.isReadOnly("/branch_miner") then
    error("'/branch_miner' is problematic, sort it out!")
  end
else 
  fs.makeDir('/branch_miner')
end

if not http.request('https://github.com/Dudestin/hogehge') -- TODO then
  error("couldn't conect to the servers for download")
end

local filenames = {
  'utility.lua',
  'config.lua',
  'track_vein.lua',
  'routing.lua',
  'main.lua'
}

local baseurl = "https://raw.githuibusercontent.com/Dudestin/" -- TODO

print('downloading CC_branch_miner from github')

for i=1, #filenames do
  local filedata = http.get(baseurl .. filenames[i])
  
  print('downloading ' .. filenames[i] .. "...")
  local file = fs.open("/branch_miner/" .. filenames[i]:sub(1, -5), "w")
  file.write(filedata.readAll())
  file.close()
end
print("files download!")