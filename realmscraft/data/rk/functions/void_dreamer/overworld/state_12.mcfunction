#remove core tentacle, cleanup overworld
bossbar remove dreamerbar
fill 32 35 -122 22 82 -127 air replace crimson_hyphae
fill 32 35 -122 22 50 -127 air replace white_concrete
fill 32 35 -122 22 50 -127 air replace bone_block
fill 32 35 -122 22 50 -127 air replace crying_obsidian
fill 32 35 -122 22 50 -127 air replace nether_wart_block
fill 32 35 -122 22 50 -127 air replace redstone_lamp
execute at @e[tag=BossCorner] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run tp @e[type=magma_cube,dx=24,dy=13,dz=35] ~ -5 ~
scoreboard players set OverworldState value 13
