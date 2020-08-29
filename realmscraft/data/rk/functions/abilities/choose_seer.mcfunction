scoreboard players set @s newSpellsLevel 1
execute as @s run function rk:abilities/wrong_spells

tag @s[tag=Skirmisher,tag=!Seer,scores={spellSets=..0}] add Seer
scoreboard players add @s[tag=Skirmisher,tag=Seer,scores={spellSets=..0}] spellSets 1

tag @s[tag=Caster,tag=!Seer,scores={spellSets=..1}] add Seer
scoreboard players add @s[tag=Caster,tag=Seer,scores={spellSets=..1}] spellSets 1

execute as @s run function rcq:give/seerspells

scoreboard players reset @s newSpellsLevel
