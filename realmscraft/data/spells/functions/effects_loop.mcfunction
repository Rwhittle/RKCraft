#loop function for other effects
#Author: Ryan Keller, Aug 2020

#increasing penalties for damaged players
effect give @a[gamemode=adventure,scores={health=9..16}] minecraft:mining_fatigue 1 0 true
effect give @a[gamemode=adventure,scores={health=5..12}] minecraft:slowness 1 0 true
effect give @a[gamemode=adventure,scores={health=..8}] minecraft:mining_fatigue 1 1 true
effect give @a[gamemode=adventure,scores={health=..4}] minecraft:slowness 1 1 true
effect give @a[gamemode=adventure,scores={health=..4}] minecraft:weakness 1 0 true

#removes hunger
effect give @a[gamemode=adventure] minecraft:saturation 999999 255 true

#invisible carrot on a stick used for grabbing corpses, only exists if nothing in the players main hand
#giving a player the "Grab" tag exempts them from this.
execute as @a[gamemode=adventure,tag=!Grab,nbt=!{SelectedItem:{}}] run replaceitem entity @s weapon.mainhand minecraft:carrot_on_a_stick{CustomModelData:1001,display:{Name:"\"Grab\""}}
execute as @a[nbt=!{SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"\"Grab\""}}}}] run clear @s minecraft:carrot_on_a_stick{display:{Name:"\"Grab\""}}
execute as @a[scores={click=1..},nbt={SelectedItem:{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"\"Grab\""}}}}] run scoreboard players add @s grab 1

scoreboard players set @a click 0

#stop players from dropping class items
execute as @e[type=#spells:undroppables,tag=!processed] run function spells:func/restrict_drop
