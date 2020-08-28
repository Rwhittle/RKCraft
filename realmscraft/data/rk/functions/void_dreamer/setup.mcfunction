#state variables
scoreboard players set MindState value 0
scoreboard players set OverworldState value 0
scoreboard players set TentaclesRemaining value 6
scoreboard players set RespawnCooldown value 600
#max number of players who can enter the mind realm in tentacle phase
scoreboard players set MaxMindPlayers value 3
scoreboard players set MaxMindPlayersPlusOne value 4
scoreboard players set MindPlayers value 0
#Boss attack timer and cooldown (in ticks)
scoreboard players set BossAttackCooldown value 100
scoreboard players set BossAttackTimer value 0
#bossbar clear
bossbar remove dreamerbar
#cleanup any possible enemies
execute at @e[tag=MindCorner] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=MindCorner] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run kill @e[tag=eyeStand,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run kill @e[type=guardian,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run kill @e[type=magma_cube,dx=24,dy=13,dz=35]
execute at @e[tag=BossCorner] run fill ~ ~ ~ ~26 ~16 ~36 crying_obsidian replace bone_block
execute at @e[tag=MindCorner] run fill ~ ~ ~ ~26 ~16 ~36 crying_obsidian replace bone_block
execute at @e[tag=MindCorner] run fill ~ ~ ~ ~26 ~16 ~36 air replace obsidian
