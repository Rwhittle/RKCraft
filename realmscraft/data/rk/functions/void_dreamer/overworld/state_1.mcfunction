#spawn enemies and set OverworldState to 2
execute at @e[tag=OverworldSpawn,type=armor_stand,limit=10,sort=random] run summon magma_cube ~ ~ ~ {Size:2,Tags:["BossSlime"]}
scoreboard players set OverworldState value 2
