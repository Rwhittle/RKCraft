tellraw @a [{"color":"green","selector":"@s"},{"text":" has used Vision!","color":"green"}]

scoreboard players set @s cooldownVision 12000
#execute as @s run function func:cooldownvision
scoreboard players set @s click 0
