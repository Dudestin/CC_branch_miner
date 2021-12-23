# how to use
```sh
$ wget hogehog -o installer.lua 
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
## `routing.lua`

## `utility.lua`
useful program for lua programming


