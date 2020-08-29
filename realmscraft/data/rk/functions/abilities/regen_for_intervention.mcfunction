tell @s[tag=!Caster] Intervention requires sacrificing access to one of a Spellcaster's Level 2 spells. If you want to have Intervention, you'll need to change Classes.
tell @s[tag=Caster,tag=!Mage2] You haven't selected Level 2 Mage spells, so you can't trade Regeneration for Intervention.

tag @s[tag=Caster,tag=Mage2] remove regeneration
give @s[tag=Caster,tag=Mage2] minecraft:carrot_on_a_stick{CustomModelData:122,display:{Name:"\"Intervention\"",Lore:["\"Spell Focus\""]}}
