tell @s[tag=!Caster] Intervention requires sacrificing access to one of a Spellcaster's Level 2 spells. If you want to have Intervention, you'll need to change Classes.
tell @s[tag=Caster,tag=!Seer2] You haven't selected Level 2 Seer spells, so you can't trade Divine Aid for Intervention.

clear @s[tag=Caster,tag=Seer2] minecraft:carrot_on_a_stick{CustomModelData:122,display:{Name:"\"Divine Aid\"",Lore:["\"Spell Focus\""]}}
give @s[tag=Caster,tag=Seer2] minecraft:carrot_on_a_stick{CustomModelData:122,display:{Name:"\"Intervention\"",Lore:["\"Spell Focus\""]}}
