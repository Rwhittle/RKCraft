execute as @s run function rk:abilities/clearEquipment

give @s[tag=Fighter] minecraft:iron_sword{Unbreakable:1}
give @s[tag=Fighter] minecraft:iron_axe{Unbreakable:1}
give @s[tag=Fighter] minecraft:shield{Unbreakable:1}
tell @s[tag=Fighter] Great, you're all set! You can still read through the Ability Selection Book and change your abilities until the quest starts. You won't be able to change your build once you've left the Tavern!

give @s[tag=Skirmisher] minecraft:stone_sword{Unbreakable:1}
give @s[tag=Skirmisher] minecraft:bow{Unbreakable:1,Enchantments:[{id:infinity,lvl:1}]}
give @s[tag=Skirmisher] minecraft:arrow
tell @s[tag=Skirmisher] Excellent, now pick your spells in the Ability Selection Book!

give @s[tag=Caster] minecraft:golden_sword{Unbreakable:1}
tell @s[tag=Caster] Excellent, now pick your spells in the Ability Selection Book!
