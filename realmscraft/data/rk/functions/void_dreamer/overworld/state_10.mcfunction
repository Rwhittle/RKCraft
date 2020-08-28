#spawn the overworld core and create a bossbar for it
#Summon mind core and core eyes, create bossbar for mind core
#say Overworld Core Spawn
execute at @e[tag=OverworldCoreStand] run summon armor_stand ~ ~ ~ {NoGravity:1b,Marker:1b,Invisible:1b,Tags:["coreStand"],Passengers:[{id:"minecraft:ghast",Health:500f,Tags:["BossCore"],Attributes:[{Name:generic.max_health,Base:500},{Name:generic.follow_range,Base:25}]}]}
bossbar add dreamerbar {"text":"Void Dreamer","color":"red"}
bossbar set dreamerbar max 500
bossbar set dreamerbar style notched_20
bossbar set dreamerbar value 0
execute at @e[tag=BossCorner] run bossbar set dreamerbar players @a[dx=24,dy=13,dz=35,gamemode=adventure]
execute at @e[tag=overworld,type=armor_stand,limit=8,sort=random] run summon armor_stand ~ ~ ~ {NoGravity:1b,Invulnerable:1b,Marker:1b,Invisible:1b,Tags:["eyeStand"],Passengers:[{id:"minecraft:guardian"}]}
scoreboard players set OverworldState value 11
