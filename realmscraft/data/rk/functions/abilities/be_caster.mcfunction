function be_caster
tag @s add Caster
tag @s remove Fighter
tag @s remove Skirmisher

execute as @s run function rk:abilities/clear_armor
execute as @s run function rk:abilities/clear_equipment
execute as @s run function rk:abilities/clear_spells

tell @s Great! Now you should choose your equipment in the Ability Selection Book.
