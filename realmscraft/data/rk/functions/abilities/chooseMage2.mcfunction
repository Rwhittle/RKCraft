scoreboard players set @s newSpellsLevel 2
execute as @s run function rk:abilities/wrongSpells

tag @s[tag=Caster,tag=!Mage,tag=!Mage2,scores={spellSets=..0}] add Mage
tag @s[tag=Caster,tag=!Mage,tag=!Mage2,scores={spellSets=..0}] add Mage2
scoreboard players add @s[tag=Caster,tag=!Mage,scores={spellSets=..1}] spellSets 2

execute as @s run function rcq:give/magespells
clear @s minecraft:wither_skeleton_skull{display:{Name:"\"Ward Undead\"",Lore:["\"Spell Focus\""]}}
give @s[tag=Caster] minecraft:torch{CustomModelData:1,display:{Name:"\"Light\"",Lore:["\"Spell Focus\""]}} 1
tag @s[tag=Caster] add light

scoreboard players reset @s newSpellsLevel
