-- Script for downloading CC_branch_miner program
TGT_DIR = "/branch_miner" -- specify install dir.

if fs.exists(TGT_DIR) then
  if not fs.isDir(TGT_DIR) or fs.isReadOnly(TGT_DIR) then
    error(TGT_DIR .. " is problematic, sort it out!")
  end
else 
  fs.makeDir(TGT_DIR)
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
  local file = fs.open(TGT_DIR .. '/' ..filenames[i]:sub(1, -5), "w")
  file.write(filedata.readAll())
  file.close()
end
print("files download!")