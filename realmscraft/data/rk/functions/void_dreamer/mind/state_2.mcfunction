#If all the mind players are dead, set OverworldState to 1 and clean up the mind
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] run scoreboard players set OverworldState value 1
execute at @e[tag=MindCorner] run execute unless entity @p[gamemode=adventure,dx=24,dy=13,dz=35,tag=!dead] run scoreboard players set MindState value 0
#if all guardians are killed set MindState to 3 and OverworldState to 7
execute at @e[tag=MindCorner] run execute unless entity @e[dx=24,dy=13,dz=35,type=guardian] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run execute unless entity @e[dx=24,dy=13,dz=35,type=guardian] run scoreboard players set MindState value 3
execute at @e[tag=MindCorner] run execute unless entity @e[dx=24,dy=13,dz=35,type=guardian] run scoreboard players set OverworldState value 7
