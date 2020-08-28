execute at @e[tag=OverworldPortal] run particle minecraft:cloud ~ ~ ~ 0.6 1 0.1 .05 100 normal
execute at @e[tag=OverworldPortal] run execute at @a[distance=0..2,gamemode=adventure,tag=!dead] run tp @p[gamemode=adventure,distance=0..2,tag=!dead] @e[tag=OverworldPortalOut,limit=1]
