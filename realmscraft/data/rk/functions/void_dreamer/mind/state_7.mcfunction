#Cleanup
#teleport corpses to matching overworld location
execute at @e[tag=MindCorner] run execute at @e[dx=24,dy=13,dz=35,type=zombie] run tp @e[type=zombie,dx=24,dy=13,dz=35,limit=1,sort=nearest] ~-37 ~24 ~-127
execute at @e[tag=MindCorner] run execute at @a[dx=24,dy=13,dz=35,gamemode=adventure,tag=dead] run tp @p[dx=24,dy=13,dz=35,gamemode=adventure,tag=!dead] ~-37 ~24 ~-127
#clean up mind guardians
execute at @e[tag=MindCorner] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run tp @e[type=magma_cube,dx=24,dy=13,dz=35] ~0 -5 ~0
scoreboard players set MindState value 0
