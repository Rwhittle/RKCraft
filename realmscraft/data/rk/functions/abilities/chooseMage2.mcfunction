scoreboard players set @s newSpellsLevel 2
execute as @s run function rk:abilities/wrongSpells

tag @s[tag=Caster,tag=!Mage,tag=!Mage2,scores={spellSets=..0}] add Mage
tag @s[tag=Caster,tag=!Mage,tag=!Mage2,scores={spellSets=..0}] add Mage2
scoreboard players add @s[tag=Caster,tag=!Mage,scores={spellSets=..1}] spellSets 2

scoreboard players reset @s newSpellsLevel
