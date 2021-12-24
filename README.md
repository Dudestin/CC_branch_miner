# how to use
```sh
$ wget https://gist.github.com/Dudestin/7527c71c7166c13e02f627f694a0f700/raw/installer.lua 
$ ./installer.lua
```
files will be installed within `/branch_miner`

# files
## `config.lua`
- `RT_PARAM` : *table*, routing parameters. `L` : base-mine length, `W` : round-trip interval
- `WANT_BLOCK_ID`  : *table*, specify want to dig block
- `TRANSPARENT_BLOCK_ID` : *table*, specify transparent block, program use this parameter to ignore them 
## `track_vein.lua`
鉱脈 (vein) 追跡関数
### algorithm
using depth-first search (DFS). 
![track_vein_tree](https://user-images.githubusercontent.com/11572379/147317099-0ef03911-7942-422e-bda1-d409fc9311c1.png)
```lua
function track_vein(level)
  for k, dir in pairs(make_tracklist(level)) do
    if is_in_table(WANT_BLOCK_ID, inspect_pos(dir).name) then --need to dig them ?
      local move_stack = move_pos(dir)
      track_vein(level + 1)  -- recursive call
      restore_pos(move_stack)
    end
  end
end
```

## `routing.lua`

## `utility.lua`
useful program for lua programming


