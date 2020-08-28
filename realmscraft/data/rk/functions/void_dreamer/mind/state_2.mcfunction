#replace crying obsidian with bone
execute at @e[tag=MindCorner] run execute at @e[dx=24,dy=13,dz=35,tag=eyeStand] run execute unless entity @e[type=guardian,distance=0] run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 minecraft:bone_block replace minecraft:crying_obsidian
#if all guardians are killed set MindState to 3 and OverworldState to 7
execute at @e[tag=MindCorner] run execute unless entity @e[dx=24,dy=13,dz=35,type=guardian] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run execute unless entity @e[dx=24,dy=13,dz=35,type=guardian] run scoreboard players set MindState value 3
execute at @e[tag=MindCorner] run execute unless entity @e[dx=24,dy=13,dz=35,type=guardian] run execute at @e[tag=MindCorner] run execute at @a[dx=24,dy=13,dz=35,gamemode=adventure,tag=!dead] run tp @p ~-37 ~24 ~-127
#If all the mind players are dead, set OverworldState to 1 and clean up the mind
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] unless score MindState value matches 3 run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] unless score MindState value matches 3 run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] unless score MindState value matches 3 run scoreboard players set OverworldState value 1
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] unless score MindState value matches 3 run scoreboard players set MindState value 0
