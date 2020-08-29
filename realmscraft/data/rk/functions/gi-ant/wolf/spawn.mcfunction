#Run as part of rk:gi-ant/wolf/main
#@s: Wolf with the spawn_gi-ant_ext tag
#Wolf Stats
#Starting Health: 20
#Rage Health: 40
#Soul Blows: 25
#Regen Timer: 30s
#Rage Timer: 15s
#Base Damage: 4

#Set health value which will trigger wolf's regen
scoreboard players set @s mobRegenTrigger 80
#Set health value which will tigger being rendered soulless
scoreboard players set @s mobSoulTrigger 75
#Set length (in ticks) of wolf's regen and rage
scoreboard players set @s mobRegenLength 600
scoreboard players set @s mobRageLength 300
#Set health value which will trigger death (only during rage)
scoreboard players set @s mobDeathTrigger 80

#Set MaxHealth (Rage Health) and Health (Starting Health)
attribute @s minecraft:generic.max_health base set 120
data merge entity @s {Health:100}
execute as @s store result score @s mobHealth run data get entity @s Health
