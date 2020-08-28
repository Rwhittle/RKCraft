#when core is dead set MindState to 6, open the MindPortal, set OverworldState to 10, and schedule mind collapse commands
#bossbar maintenance
execute store result bossbar dreamerbar value run data get entity @e[tag=BossCore,limit=1] Health
execute at @e[tag=MindCorner] run bossbar set dreamerbar players @a[dx=24,dy=13,dz=35,gamemode=adventure]
execute unless entity @e[tag=BossCore,limit=1] run scoreboard players set MindState value 6
execute unless entity @e[tag=BossCore,limit=1] run scoreboard players set OverworldState value 6
#execute unless entity @e[tag=BossCore,limit=1] run say MindState 6
#attacks
execute if score BossAttackTimer value matches 0 at @e[tag=BossCore] run execute at @a[distance=1..25,limit=2,gamemode=adventure,tag=!dead] run summon area_effect_cloud ~ ~1 ~ {Particle:"enchanted_hit",NoGravity:1b,Radius:3f,Duration:40,Tags:["attackCloud"]}
execute at @e[tag=attackCloud,nbt={Age:1}] run playsound minecraft:entity.evoker.prepare_attack block @a ^ ^ ^
execute at @e[tag=attackCloud,nbt={Age:39}] run particle minecraft:soul_fire_flame ~ ~1 ~ 0.2 0.2 0.2 0.1 100 normal
execute at @e[tag=attackCloud,nbt={Age:39}] run effect give @a[distance=0..3] minecraft:instant_damage 1 0 true
execute at @e[tag=attackCloud,nbt={Age:39}] run playsound minecraft:entity.wither.hurt block @a ^ ^ ^
#attack timer tick
scoreboard players add BossAttackTimer value 1
execute if score BossAttackTimer value >= BossAttackCooldown value run scoreboard players set BossAttackTimer value 0
#replace fireballs with void slimes
execute at @e[tag=MindCorner] run kill @e[type=fireball,dx=24,dy=13,dz=35]
