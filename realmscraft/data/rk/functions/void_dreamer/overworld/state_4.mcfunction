execute at @e[tag=OverworldPortal] run execute if score MindPlayers value < MaxMindPlayers value run particle minecraft:cloud ~ ~ ~ 0.6 1 0.1 .05 100 normal
execute at @e[tag=OverworldPortal] run execute at @p[distance=0..2,gamemode=adventure,tag=!dead] run scoreboard players add MindPlayers value 1
execute at @e[tag=OverworldPortal] run execute if score MindPlayers value < MaxMindPlayersPlusOne value run execute as @p[distance=0..2,gamemode=adventure,tag=!dead] run tp @s @e[tag=OverworldPortalOut,limit=1]
