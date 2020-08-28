#remove core tentacle, cleanup overworld
say bossfight over
bossbar remove dreamerbar
execute at @e[tag=BossCorner] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run tp @e[type=magma_cube,dx=24,dy=13,dz=35] ~ -5 ~
scoreboard players set OverworldState value 13
