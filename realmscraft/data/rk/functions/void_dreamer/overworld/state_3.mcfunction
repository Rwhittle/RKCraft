#Open the overworld portal, schedule it to close in 30 seconds, set OverworldState to 4
#say OverworldState 3
schedule function rk:void_dreamer/overworld/state_5 30s
#say scheduled state_5
scoreboard players set OverworldState value 4
#say Set OverworldState 4
