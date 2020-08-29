scoreboard players set @s newSpellsLevel 1
execute as @s run function rk:abilities/wrongSpells

tag @s[tag=Skirmisher,tag=!Support,scores={spellSets=..0}] add Support
scoreboard players add @s[tag=Skirmisher,tag=!Support,scores={spellSets=..0}] spellSets 1

tag @s[tag=Caster,tag=!Support,scores={spellSets=..1}] add Support
scoreboard players add @s[tag=Caster,tag=!Support,scores={spellSets=..1}] spellSets 1

scoreboard players reset @s newSpellsLevel
