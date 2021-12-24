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
```lua
-- 再帰的に探索を行う．深さ優先探索.
-- level : 現在までの追跡階層，木構造でいう深さ.
function track_vein(level)
  for k, dir in pairs(make_tracklist(level)) do   -- 木構造のchild候補のイテレータ
    if is_in_table(WANT_BLOCK_ID, inspect_pos(dir).name) then -- 必要な鉱石の鉱脈か ?
      local move_stack = move_pos(dir) -- 鉱石を採掘しその位置へ移動
      track_vein(level + 1)  -- 再帰呼び出し
      restore_pos(move_stack)  -- move_pos()以前の位置を復元
    end
  end
end
```
![track_vein_tree](https://user-images.githubusercontent.com/11572379/147317099-0ef03911-7942-422e-bda1-d409fc9311c1.png)

## `routing.lua`

## `utility.lua`
useful program for lua programming


