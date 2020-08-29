tellraw @a [{"color":"yellow","selector":"@s"},{"text":" has used Intervention","color":"yellow"}

clear @s carrot_on_a_stick{display:{Name:"\"Intervention\"",Lore:["\"Spell Focus\""]}}
execute as @s[nbt=!{Inventory:[{id:"minecraft:carrot_on_a_stick",tag:{display:{Name:"\"Intervention\""}}}]}] run give @s minecraft:barrier{CustomModelData:1,display:{Name:"\"Intervention used\"",Lore:["\"Spell Focus\""]}} 1
scoreboard players set @s click 0
