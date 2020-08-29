tag @s add Skirmisher
tag @s remove Fighter
tag @s remove Caster

execute as @s run function rk:abilities/clear_armor
execute as @s run function rk:abilities/clear_equipment
execute as @s run function rk:abilities/clear_spells

give @s minecraft:leather_helmet{Unbreakable:1}
give @s minecraft:leather_chestplate{Unbreakable:1}
give @s minecraft:leather_leggings{Unbreakable:1}
give @s minecraft:leather_boots{Unbreakable:1}
tell @s Great! Now you should choose your equipment in the Ability Selection Book.
