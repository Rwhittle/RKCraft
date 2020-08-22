execute at @e[tag=OverworldPortal] run execute if score MindPlayers value matches 0..9 run execute particle minecraft:cloud ~ ~ ~ 0.6 1 0.1 .05 100 normal
execute at @e[tag=OverworldPortal] run execute if score MindPlayers value matches 0..9 run execute at @p[distance=0..2,gamemode=adventure] run scoreboard players add MindPlayers value 1
execute at @e[tag=OverworldPortal] run execute if score MindPlayers value matches 0..10 run execute at @a[distance=0..2,gamemode=adventure] run tp @p[gamemode=adventure,distance=0..2] @e[tag=OverworldPortalOut,limit=1]
