#For each player within 2 blocks of MindPortal, teleport them to MindPortalOut. If no live players remain in the mind, set MindState to 7
execute at @e[tag=MindPortal] run particle minecraft:cloud ~ ~ ~ 0.6 1 0.1 .05 100 normal
execute at @e[tag=MindPortal] run tp @p[distance=0..2,gamemode=adventure] @e[tag=MindPortalOut,limit=1]
execute at @e[tag=MindCorner] run execute unless entity @a[dx=24,dy=13,dz=35,gamemode=adventure,tag=!dead] run scoreboard players set MindState value 7
execute at @e[tag=MindCorner] run execute unless entity @a[dx=24,dy=13,dz=35,gamemode=adventure,tag=!dead] run scoreboard players set OverworldState value 10
#summon falling blocks above players on boss attack ticks
execute at @e[tag=MindCorner] if score BossAttackTimer value matches 0 run execute at @a[dx=24,dy=13,dz=35,gamemode=adventure,limit=5,tag=!dead] run summon falling_block ~ ~10 ~ {BlockState:{Name:"minecraft:obsidian"},Time:1,DropItem:0b,HurtEntities:1b,FallHurtMax:6,FallDistance:1f,FallHurtAmount:2f}
#BossAttackTimer maintenance
scoreboard players add BossAttackTimer value 1
execute if score BossAttackTimer value >= BossAttackCooldown value run scoreboard players set BossAttackTimer value 0
