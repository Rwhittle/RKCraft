#spawn enemies and set OverworldState to 2
#say state 1
execute at @e[tag=OverworldSpawn,type=armor_stand,limit=10,sort=random] run summon magma_cube ~ ~ ~ {Size:2,PersistenceRequired:1b}
execute unless entity @e[type=minecraft:guardian] run kill @e[type=minecraft:armor_stand,tag=eyeStand]
execute unless entity @e[type=minecraft:guardian] run kill @e[type=minecraft:guardian]
#say summoned void slimes
execute at @e[tag=MindCorner] run execute at @a[dx=24,dy=13,dz=35,gamemode=adventure,tag=!dead] run tp @p[dx=24,dy=13,dz=35,gamemode=adventure,tag=!dead] ~-37 ~24 ~-127
execute at @e[type=magma_cube] run playsound minecraft:entity.phantom.hurt hostile @a ^ ^ ^
#say teleported players
scoreboard players set MindPlayers value 0
scoreboard players set MindState value 0
scoreboard players set OverworldState value 2
#say set overworld state to 2
