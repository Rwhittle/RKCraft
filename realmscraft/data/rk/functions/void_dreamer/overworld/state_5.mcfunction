#close the portal, then if there are no mind players, set OverworldState to 1, otherwise summon void slimes, set MindState to 1, and set OverworldState to 6
execute unless score MindPlayers value matches 1.. run scoreboard players set OverworldState value 1
execute if score MindPlayers value matches 1.. run scoreboard players set MindState value 1
execute if score MindPlayers value matches 1.. run scoreboard players set OverworldState value 6
execute if score MindPlayers value matches 1.. run execute at @e[tag=OverworldSpawn,type=armor_stand,limit=10,sort=random] run summon magma_cube ~ ~ ~ {Size:2,Tags:["BossSlime"]}
