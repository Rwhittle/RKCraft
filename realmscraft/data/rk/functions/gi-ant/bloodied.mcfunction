#Run as part of rk:gi-ant/main
#Remove bloodied tag after crouching for 5 seconds (100 ticks)
execute as @a[tag=bloodied,scores={wipeBlood=100..}] run tag @s remove bloodied
#Do not track crouching if not bloodied
scoreboard players set @a[tag=!bloodied] wipeBlood 0
#Logic for resetting wipeBlood if attacking (dealing damamge)
#TODO: Similar call should be done by spells as well
scoreboard players set @a[tag=bloodied,scores={wipeBloodReset1=1..}] wipeBlood 0
scoreboard players set @a[scores={wipeBlood=0}] wipeBloodReset1 0
#Logic for resetting wipeBlood if being attacked (taking damage)
scoreboard players set @a[tag=bloodied,scores={wipeBloodReset2=1..}] wipeBlood 0
scoreboard players set @a[scores={wipeBlood=0}] wipeBloodReset2 0
#Logic for bloodied corpses to lose bloodied tag after 5 seconds (100 ticks)
scoreboard players add @e[type=minecraft:zombie,tag=corpse,tag=bloodied] wipeBlood 1
execute as @e[type=minecraft:zombie,tag=corpse,tag=bloodied,scores={wipeBlood=300..}] run tag @s remove bloodied
