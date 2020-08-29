scoreboard players set @s newSpellsLevel 2
execute as @s run function rk:abilities/wrong_spells

tag @s[tag=Caster,tag=!Mage,tag=!Mage2,scores={spellSets=..0}] add Mage2
tag @s[tag=Caster,tag=!Mage,tag=Mage2,scores={spellSets=..0}] add Mage
scoreboard players add @s[tag=Caster,scores={spellSets=..0}] spellSets 2

execute as @s[tag=Mage2,tag=!Maged] run function rcq:give/magespells
tag @s[tag=Mage2] add Maged
clear @s minecraft:wither_skeleton_skull{display:{Name:"\"Ward Undead\"",Lore:["\"Spell Focus\""]}}
give @s[tag=Caster,tag=!light] minecraft:torch{CustomModelData:1,display:{Name:"\"Light\"",Lore:["\"Spell Focus\""]}} 1
tag @s[tag=Caster] add light

scoreboard players reset @s newSpellsLevel
