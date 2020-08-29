#When no tentacle eyes remain, decrement TentaclesRemaining and clean up the armor stands they were riding, then if TentaclesRemaining = 0, set OverworldState to 9, otherwise set OverworldState to 1
#replace killed overworld guardians unless the corresponding mind guardian has been killed
#execute at @e[tag=BossCorner] run execute at @e[tag=eyeStand,dx=24,dy=13,dz=35] run execute unless entity @e[type=minecraft:guardian,distance=0] run say armorstand missing guardian
#execute at @e[tag=BossCorner] run execute at @e[tag=eyeStand,dx=24,dy=13,dz=35] run execute unless entity @e[type=minecraft:guardian,distance=0] run execute positioned ~37 ~-24 ~127 run execute if entity @e[type=guardian,distance=0..1.5] run say detected corresponding guardian
execute at @e[tag=BossCorner] run execute as @e[tag=overworld,dx=24,dy=13,dz=35] run execute at @s run execute unless entity @e[type=minecraft:guardian,distance=0] run execute positioned ~37 ~-24 ~127 run execute if entity @e[type=guardian,distance=0..1] run scoreboard players add @s RespawnTimer 1
execute at @e[tag=BossCorner] run execute as @e[tag=eyeStand,dx=24,dy=13,dz=35] run execute at @s run execute unless entity @e[type=minecraft:guardian,distance=0] run execute positioned ~37 ~-24 ~127 run execute unless entity @e[type=guardian,distance=0..1] run execute positioned ~-37 ~24 ~-127 run fill ~-1 ~-1 ~-1 ~1 ~2 ~1 minecraft:bone_block replace minecraft:crying_obsidian
execute as @e[tag=overworld] run execute if score @s RespawnTimer = RespawnCooldown value at @s run playsound entity.blaze.shoot block @a ^ ^ ^
execute as @e[tag=overworld] run execute if score @s RespawnTimer = RespawnCooldown value at @s run summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["eyeStand"],Passengers:[{id:"minecraft:guardian"}]}
execute as @e[tag=overworld] run execute if score @s RespawnTimer >= RespawnCooldown value run scoreboard players set @s RespawnTimer 0
#clear out eyeStands once all guardians have been killed
execute unless entity @e[type=minecraft:guardian] run kill @e[type=minecraft:armor_stand,tag=eyeStand]
execute unless entity @e[type=minecraft:guardian] run scoreboard players remove TentaclesRemaining value 1
#send to boss damage phase if no tentacles remain
execute if score TentaclesRemaining value matches 0 run scoreboard players set OverworldState value 9
execute if score TentaclesRemaining value matches 0 run scoreboard players set MindState value 4
#send back to state 1 if tentacles still remain
execute unless entity @e[type=minecraft:guardian] unless score TentaclesRemaining value matches 0 run scoreboard players set OverworldState value 1
