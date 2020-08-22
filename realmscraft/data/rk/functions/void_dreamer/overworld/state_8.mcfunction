#When no tentacle eyes remain, decrement TentaclesRemaining and clean up the armor stands they were riding, then if TentaclesRemaining = 0, set OverworldState to 9, otherwise set OverworldState to 1
execute at @e[tag=BossCorner] unless entity @e[dx=24,dy=13,dz=35,type=minecraft:guardian] run kill @e[type=minecraft:armor_stand,tag=eyeStand]
execute at @e[tag=BossCorner] unless entity @e[dx=24,dy=13,dz=35,type=minecraft:guardian] run scoreboard players remove @e[tag=TentaclesRemaining] value 1
execute if score @e[tag=TentaclesRemaining,limit=1] value matches 0 run scoreboard players set OverworldState value 9
execute at @e[tag=BossCorner] unless entity @e[dx=24,dy=13,dz=35,type=minecraft:guardian] run scoreboard players set OverworldState value 1
execute at @e[tag=BossCorner] unless entity @e[dx=24,dy=13,dz=35,type=minecraft:guardian] run execute at @e[tag=MindCorner] run teleport @a[dx=24,dy=13,dz=35] @e[tag=MindPortalOut,limit=1]
