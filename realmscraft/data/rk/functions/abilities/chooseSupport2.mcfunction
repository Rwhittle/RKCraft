scoreboard players set @s newSpellsLevel 2
execute as @s run function rk:abilities/wrongSpells

tag @s[tag=Caster,tag=!Support,tag=!Support2,scores={spellSets=..0}] add Support
tag @s[tag=Caster,tag=!Support,tag=!Support2,scores={spellSets=..0}] add Support2
scoreboard players add @s[tag=Caster,tag=!Support,scores={spellSets=..1}] spellSets 2

scoreboard players reset @s newSpellsLevel
