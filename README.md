| behavior |  input   |  output  |
|----------|:--------:|:--------:|
|It can take basic information and initialize a tamagotchi pet.|"lil dragon"|["lil dragon", 10, 10, 10, 0]|
|Tamagotchi is alive if food levels are above 0|10|True|
|Tamagotchi is dead if food levels are 0|0|False|
|Decrease all food levels by 1 across multiple tamagotchi's|Tamagotchi.time_passes()|9|
|Once dead, feeding it will NOT revive it| tmgc1.feed(), tmgc1.is_alive()? | false |


name instance
food level 10
sleep level 10
activity level 10
