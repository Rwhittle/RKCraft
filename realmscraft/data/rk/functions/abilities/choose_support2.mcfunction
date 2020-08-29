scoreboard players set @s newSpellsLevel 2
execute as @s run function rk:abilities/wrong_spells

tag @s[tag=Caster,tag=!Support,tag=!Support2,scores={spellSets=..0}] add Support
tag @s[tag=Caster,tag=!Support,tag=!Support2,scores={spellSets=..0}] add Support2
scoreboard players add @s[tag=Caster,tag=!Support,scores={spellSets=..1}] spellSets 2

execute as @s run function rcq:give/supportspells
clear @s minecraft:carrot_on_a_stick{CustomModelData:102,display:{Name:"\"Repair Armor\"",Lore:["\"Spell Focus\""]}}
scoreboard players reset @s cooldownRA
give @s[tag=Caster] minecraft:torch{CustomModelData:1,display:{Name:"\"Light\"",Lore:["\"Spell Focus\""]}} 1
tag @s[tag=Caster] add light

scoreboard players reset @s newSpellsLevel
