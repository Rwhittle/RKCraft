scoreboard players remove @a[scores={cooldownHeal=1..}] cooldownHeal 1
scoreboard players remove @a[scores={cooldownRA=1..}] cooldownRA 1
scoreboard players remove @a[scores={cooldownTorch=1..}] cooldownTorch 1
scoreboard players remove @a[scores={cooldownEmpower=1..}] cooldownEmpower 1
scoreboard players remove @a[scores={cooldownMM=1..}] cooldownMM 1
scoreboard players remove @a[scores={cooldownEnfeeble=1..}] cooldownEnfeeble 1
scoreboard players remove @a[scores={cooldownLB=1..}] cooldownLB 1
scoreboard players remove @a[scores={cooldownGuidance=1..}] cooldownGuidance 1
scoreboard players remove @a[scores={cooldownVision=1..}] cooldownVision 1
scoreboard players remove @a[scores={cooldownRD=1..}] cooldownRD 1
scoreboard players remove @a[scores={cooldownSoL=1..}] cooldownSoL 1


execute as @a[scores={cooldownHeal=1}] run function func:cooldownheal
execute as @a[scores={cooldownRA=1}] run function func:cooldownrepair
execute as @a[tag=light] run function func:cooldowntorch
execute as @a[scores={cooldownEmpower=1}] run function func:cooldownempower
execute as @a[tag=mm] run function func:cooldownmm
execute as @a[scores={cooldownEnfeeble=1}] run function func:cooldownenfeeble
execute as @a[scores={cooldownLB=1}] run function func:cooldownbolt
execute as @a[scores={cooldownGuidance=1}] run function func:cooldownguide
execute as @a[scores={cooldownVision=1}] run function func:cooldownvision
execute as @a[scores={cooldownRD=1}] run function func:cooldownrd
execute as @a[scores={cooldownSoL=1}] run function func:cooldownsol
