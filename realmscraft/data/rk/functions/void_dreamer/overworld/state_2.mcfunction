#set OverworldState to 3 if no magma cubes remain
execute at @e[tag=BossCorner] unless entity @e[dx=24,dy=13,dz=35,type=minecraft:magma_cube] run scoreboard players set OverworldState value 3
