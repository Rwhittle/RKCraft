tell @s[tag=!Caster] Intervention requires sacrificing access to one of a Spellcaster's Level 2 spells. If you want to have Intervention, you'll need to change Classes.
tell @s[tag=Caster,tag=!Support2] You haven't selected Level 2 Support spells, so you can't trade Seed of Life for Intervention.

clear @s[tag=Caster,tag=Support2] minecraft:carrot_on_a_stick{CustomModelData:203,display:{Name:"\"Seed of Life\"",Lore:["\"Spell Focus\""]}}
scoreboard players reset @s[tag=Caster,tag=Support2] cooldownSoL
give @s[tag=Caster,tag=Support2] minecraft:carrot_on_a_stick{CustomModelData:122,display:{Name:"\"Intervention\"",Lore:["\"Spell Focus\""]}}
