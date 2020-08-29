function beCaster
tag @s add Caster
tag @s remove Fighter
tag @s remove Skirmisher

execute as @s run function rk:abilities/clearArmor
execute as @s run function rk:abilities/clearEquipment
execute as @s run function rk:abilities/clearSpells

tell @s Great! Now you should choose your equipment in the Ability Selection Book.
