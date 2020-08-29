#cooldown function for "lightning bolt"
#Author: Ryan Keller, Aug 2020

#give cooldown item
execute as @s[scores={cooldownLB=0},nbt=!{Inventory:[{id:"minecraft:trident"}]}] run replaceitem entity @s weapon.mainhand minecraft:barrier{CustomModelData:1,display:{Name:"\"Lightning Bolt on Cooldown\"",Lore:["\"Spell Focus\""]}} 1
scoreboard players set @s[scores={cooldownLB=0},nbt=!{Inventory:[{id:"minecraft:trident"}]}] cooldownLB 1200

#return spell
clear @s[scores={cooldownLB=1}] minecraft:barrier{display:{Name:"\"Lightning Bolt on Cooldown\""}}
give @s[scores={cooldownLB=1}] minecraft:trident{display:{Name:"\"Lightning Bolt\"",Lore:["\"Spell Attack\""]},AttributeModifiers:[{Amount:0}]}

# Stop moving focus in inventory from duplicating
clear @a[nbt={Inventory:[{id:"minecraft:trident"}]}] minecraft:barrier{display:{Name:"\"Lightning Bolt on Cooldown\""}}
scoreboard players set @a[nbt={Inventory:[{id:"minecraft:trident"}]}] cooldownLB 0
