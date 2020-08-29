tag @s add Fighter
tag @s remove Skirmisher
tag @s remove Caster

execute as @s run function rk:abilities/clear_armor
execute as @s run function rk:abilities/clear_equipment
execute as @s run function rk:abilities/clear_spells

give @s minecraft:chainmail_helmet{Unbreakable:1}
give @s minecraft:chainmail_chestplate{Unbreakable:1}
give @s minecraft:chainmail_leggings{Unbreakable:1}
give @s minecraft:chainmail_boots{Unbreakable:1}
give @s minecraft:iron_sword{Unbreakable:1}
give @s[tag=Fighter] minecraft:iron_axe{Unbreakable:1}
give @s[tag=Fighter] minecraft:shield{Unbreakable:1}
tell @s Great, you're all set! You can still read through the Ability Selection Book and change your abilities until the quest starts. You won't be able to change your build once you've left the Tavern!
