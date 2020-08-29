scoreboard players set @s newSpellsLevel 2
execute as @s run function rk:abilities/wrongSpells

tag @s[tag=Caster,tag=!Seer,tag=!Seer2,scores={spellSets=..0}] add Seer
tag @s[tag=Caster,tag=!Seer,tag=!Seer2,scores={spellSets=..0}] add Seer2
scoreboard players add @s[tag=Caster,tag=!Seer,scores={spellSets=..1}] spellSets 2

execute as @s run function rcq:give/seerspells

scoreboard players reset @s newSpellsLevel
