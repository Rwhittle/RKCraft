tell @s[tag=!Caster] Intervention requires sacrificing access to one of a Spellcaster's Level 2 spells. If you want to have Intervention, you'll need to change Classes.
tell @s[tag=Caster,tag=!Mage2] You haven't selected Level 2 Mage spells, so you can't trade Lightning Bolt for Intervention.

tag @s[tag=Caster,tag=Mage2] remove lightning_bolt
clear @s[tag=Caster,tag=Mage2] minecraft:trident{display:{Name:"\"Lightning Bolt\"",Lore:["\"Spell Attack\""]},AttributeModifiers:[{Amount:0}]}
scoreboard players reset @s[tag=Caster,tag=Mage2] cooldownLB
give @s[tag=Caster,tag=Mage2] minecraft:carrot_on_a_stick{CustomModelData:122,display:{Name:"\"Intervention\"",Lore:["\"Spell Focus\""]}}
