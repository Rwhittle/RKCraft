#Run as part of rk:gi-ant/spider/main
#@s: Spider with the spawn_gi-ant_ext tag
#Spider Stats
#Starting Health: 10
#Rage Health: 20
#Soul Blows: 10
#Regen Timer: 15s
#Rage Timer: 10s
#Base Damage: 2

#Set health value which will trigger spider's regen
scoreboard players set @s mobRegenTrigger 90
#Set health value which will tigger being rendered soulless
scoreboard players set @s mobSoulTrigger 90
#Set length (in ticks) of spider's regen and rage
scoreboard players set @s mobRegenLength 300
scoreboard players set @s mobRageLength 200
#Set health value which will trigger death (only during rage)
scoreboard players set @s mobDeathTrigger 90

#Set MaxHealth (Rage Health) and Health (Starting Health)
attribute @s minecraft:generic.max_health base set 110
data merge entity @s {Health:100}
execute as @s store result score @s mobHealth run data get entity @s Health

#Persist Forever
data merge entity @s {PersistenceRequired:1b}
