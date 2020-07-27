Globals [dice
expose
bruh
money-P1
money-P2
game-over]
turtles-own [TTL
  money
olive
silk
jade
gold
horses
armour
turn
P1
P2]
patches-own [
China
India
Phoenicia
Rome
C.A.
  price-olive
  price-silk
  price-jade
  price-gold
  price-horses
  price-armour]

to setup
  ca
  import-pcolors "silkRoad.png"

  ask patches with [(pxcor = 13 or pxcor = 12) AND (pycor = 5 or pycor = 4)]
  [set China 1]
  ask patches with [(pxcor = -1 or pxcor = 0) AND (pycor = 10 or pycor = 11)]
  [set C.A. 1]
  ask patches with [(pxcor = -8 or pxcor = -7) AND (pycor = -12 or pycor = -11)]
  [set Phoenicia 1]
  ask patches with [(pxcor = -15 or pxcor = -14) AND (pycor = -1 or pycor = -2)]
  [set Rome 1]
  ask patches with [(pxcor = 9 or pxcor = 10) AND (pycor = -11 or pycor = -12)]
  [set India 1]

  ask patches with [Rome = 1] [let g (list "armour" "silk" "olive"
    "jade" "gold" "horses")
    let p (list 4 12 4 10 9 7)
    set price-armour (item 0 p)
    set price-silk (item 1 p)
    set price-olive (item 2 p)
    set price-jade (item 3 p)
    set price-gold (item 4 p)
    set price-horses (item 5 p)
  ]

   ask patches with [India = 1] [let g (list "armour" "silk" "olive"
    "jade" "gold" "horses")
    let p (list 7 5 6 3 12 13)
    set price-armour (item 0 p)
    set price-silk (item 1 p)
    set price-olive (item 2 p)
    set price-jade (item 3 p)
    set price-gold (item 4 p)
    set price-horses (item 5 p)
    ]
    ask patches with [Phoenicia = 1] [let g (list "armour" "silk" "olive"
    "jade" "gold" "horses")
    let p (list 4 8 3 10 9 14)
    set price-armour (item 0 p)
    set price-silk (item 1 p)
    set price-olive (item 2 p)
    set price-jade (item 3 p)
    set price-gold (item 4 p)
    set price-horses (item 5 p)
    ]
    ask patches with [C.A. = 1] [let g (list "armour" "silk" "olive"
    "jade" "gold" "horses")
    let p (list 10 8 9 5 6 4)
    set price-armour (item 0 p)
    set price-silk (item 1 p)
    set price-olive (item 2 p)
    set price-jade (item 3 p)
    set price-gold (item 4 p)
    set price-horses (item 5 p)
    ]
    ask patches with [China = 1] [let g (list "armour" "silk" "olive"
    "jade" "gold" "horses")
    let p (list 13 3 8 4 10 12)
    set price-armour (item 0 p)
    set price-silk (item 1 p)
    set price-olive (item 2 p)
    set price-jade (item 3 p)
    set price-gold (item 4 p)
    set price-horses (item 5 p)
    ]


  ask one-of patches with [China = 1]
  [sprout 1 [set size 2 set color 46 set turn 1
    set P1 1
  set heading 0
  set money 5]]

  Ask one-of patches with [Rome = 1]
  [sprout 1 [set size 2 set color 6 set turn 0
  set P2 1
    set heading 0
  set money 5]]

  ask turtles [if P1 = 1 [set silk 5
    set horses 2
    set jade 5]
  ]
  ask turtles [if P2 = 1 [set armour 4
    set gold 2
    set horses 2
    set olive 4]
  ]
  Ask patch -1 15 [set plabel "The Silk Road Game (2 Player)"]
  Ask patch 1 12.5 [set plabel "Central Asia-"]
  ask patch -11 -3 [set plabel "- Rome"]
  ask patch 15.5 2 [set plabel "-China"]
  ask patch -6 -14 [set plabel "-Phoenicia"]
  ask patch 12 -13.7 [set plabel "-India"]
  ask turtles with [P1 = 1] [let m money set money-P2 m]
  ask turtles with [P2 = 1] [let m money set money-P1 m]
  set expose false
  set bruh false
  set game-over false
  reset-ticks
end

to roll-dice
  set dice ((random 11) + 2)
  ask turtles with [turn = 0] [set turn 2]
      ask turtles with [turn = 1] [set turn 0]
ask turtles with [turn = 2] [set turn 1]
  ask turtles with [turn = 1] [set ttl (dice)]
  tick-advance 1
  let a ticks / 2
  ask patch 14 13 [set plabel (word "Total turns: " a)]
end


to go
  ask turtles with [turn = 1] [ifelse ttl > 0 AND turn = 1 AND pcolor != black
    [fd 1
      set ttl (ttl - 1)]
    [ if pcolor = black [bk 1] ]
  ]
end
to go-up
  ask turtles with [turn = 1] [set heading 0]
end
to go-left
  ask turtles with [turn = 1] [set heading 270]
end
to go-right
  ask turtles with [turn = 1] [set heading 90]
end
to go-down
  ask turtles with [turn = 1] [set heading 180]
end

to bag-check
  ifelse mouse-down?
  [let senetor min-one-of turtles [distancexy mouse-xcor mouse-ycor]
  ask senetor [if distancexy mouse-xcor mouse-ycor < (size / 2) [set expose true]
  ]
    if expose = true [ask senetor [let g gold ask patch 8 6 [set plabel (word "Amount of Gold: " g)]
      let o olive ask patch 8 4 [set plabel (word "Amount of Olives: " o)]
      let s silk ask patch 8 2 [set plabel (word "Amount of Silk: " s)]
      let a armour ask patch 8 0 [set plabel (word "Amount of Armour: " a)]
      let j jade ask patch 8 -2 [set plabel (word "Amount of Jade: " j)]
      let h horses ask patch 8 -4 [set plabel (word "Amount of Horses: " h)]
      ]
  ]
  ]
  [set expose false
  ask patch 8 6 [set plabel ""]
  ask patch 8 4 [set plabel ""]
  ask patch 8 2 [set plabel ""]
  ask patch 8 0 [set plabel ""]
  ask patch 8 -2 [set plabel ""]
  ask patch 8 -4 [set plabel ""]
  ]


end
to price-check
  ifelse mouse-down?
  [let senate 0
    let g 0
    let o 0
    let a 0
    let s 0
    let j 0
    let h 0
    set senate min-one-of patches with [Rome = 1 or India = 1 or Phoenicia = 1 or China = 1
    or C.A. = 1] [distancexy mouse-xcor mouse-ycor]
    ask senate [if distancexy mouse-xcor mouse-ycor < (1) [set bruh true set g price-gold
      set o price-olive
    set a price-armour
    set s price-silk
    set j price-jade
    set h price-horses]]

    if bruh = true [ask senate [ask patch -2 6 [Set plabel (word "Price of Gold: " g)]
      ask patch -2 4 [set plabel (word "Price of Olive: " o)]
      ask patch -2 2 [set plabel (word "Price of Armour: " a)]
      ask patch -2 0 [set plabel (word "Price of Silk: " s)]
      ask patch -2 -2 [set plabel (word "Price of Jade: " j)]
      ask patch -2 -4 [set plabel (word "Price of Horses: " h)]
      ]]
  ]
  [set bruh false
    ask patch -2 6 [set plabel ""]
  ask patch -2 4 [set plabel ""]
  ask patch -2 2 [set plabel ""]
    ask patch -2 0 [set plabel ""]
    ask patch -2 -2 [set plabel ""]
    ask patch -2 -4 [set plabel ""]
  ]
end
to buy/sell-olive
  ask turtles with [turn = 1 AND (Rome = 1 or C.A. = 1 or India = 1 or Phoenicia = 1 or China = 1)]
  [let o olive
    ifelse o > 0 AND o < 10
    [ifelse buy = true AND money > price-olive

  [set money (money - price-olive)
    set olive (olive + 1)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    [set olive (olive - 1)
   set money (money + price-olive)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    ]
    [ask patch 15 15 [set plabel "too few/great olives or money!"
      set plabel-color yellow
      wait 2
      set plabel ""]]
  ]
end
to buy/sell-gold
  ask turtles with [turn = 1 AND (Rome = 1 or C.A. = 1 or India = 1 or Phoenicia = 1 or China = 1)]
  [let g gold
    ifelse g > 0 AND g < 8
    [ifelse buy = true AND money > price-gold

  [set money (money - price-gold)
    set gold (gold + 1)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    [set gold (gold - 1)
   set money (money + price-gold)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    ]
    [ask patch 15 15 [set plabel "too few/great gold or money!"
      set plabel-color yellow
      wait 2
      set plabel ""]]
  ]
end
to buy/sell-horses
  ask turtles with [turn = 1 AND (Rome = 1 or C.A. = 1 or India = 1 or Phoenicia = 1 or China = 1)]
  [let h horses
    ifelse h > 0 AND h < 9
    [ifelse buy = true AND money > price-horses

    [set money (money - price-horses)
    set horses (horses + 1)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    [set horses (horses - 1)
   set money (money + price-horses)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    ]
    [ask patch 15 15 [set plabel "too few/great horses or money!"
      set plabel-color yellow
      wait 2
      set plabel ""]]
  ]
end
to buy/sell-silk
  ask turtles with [turn = 1 AND (Rome = 1 or C.A. = 1 or India = 1 or Phoenicia = 1 or China = 1)]
  [let s silk
    ifelse s > 0 AND s < 9
    [ifelse buy = true AND money > price-silk

    [set money (money - price-silk)
    set silk (silk + 1)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    [set silk (silk - 1)
   set money (money + price-silk)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    ]
    [ask patch 15 15 [set plabel "too few/great silk or money!"
      set plabel-color yellow
      wait 2
      set plabel ""]]
  ]
end
to buy/sell-armour
  ask turtles with [turn = 1 AND (Rome = 1 or C.A. = 1 or India = 1 or Phoenicia = 1 or China = 1)]
  [let a armour
    ifelse a > 0 AND a < 9
    [ifelse buy = true AND money > price-armour

    [set money (money - price-armour)
    set armour (armour + 1)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    [set armour (armour - 1)
   set money (money + price-armour)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    ]
    [ask patch 15 15 [set plabel "too few/great armour or money!"
      set plabel-color yellow
      wait 2
      set plabel ""]]
  ]
end
to buy/sell-jade
  ask turtles with [turn = 1 AND (Rome = 1 or C.A. = 1 or India = 1 or Phoenicia = 1 or China = 1)]
  [let j jade
    ifelse j > 0 AND j < 9
    [ifelse buy = true AND money > price-armour

    [set money (money - price-jade)
    set jade (jade + 1)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    [set jade (jade - 1)
   set money (money + price-jade)
      ifelse color = grey [set money-P1 money]
      [set money-P2 money]
  ]
    ]
    [ask patch 15 15 [set plabel "too few/great jade or money!"
      set plabel-color yellow
      wait 2
      set plabel ""]]
  ]
end
to finish-game
  cp
  ct
  ask patch 0 5 [set plabel "GAME"]
  ask patch 2 2 [set plabel "OVER"]
  if money-P1 > money-P2 or money-P2 > money-P1 [set game-over true]
  if game-over = true [let r money-P1
    let c money-P2

    ifelse r > c AND r != c
    [ask patch 5 -6 [set plabel "grey wins!"]]
    [ifelse c > r [ask patch 5 -6 [set plabel "yellow wins"]]
    [ask patch 5 -6 [set plabel "tie!"]]
  ]
  ]
end
@#$#@#$#@
GRAPHICS-WINDOW
156
12
593
450
-1
-1
13.0
1
13
1
1
1
0
1
1
1
-16
16
-16
16
0
0
1
ticks
30.0

BUTTON
45
51
141
84
setup
setup
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

MONITOR
63
105
120
150
NIL
dice
17
1
11

BUTTON
44
152
129
185
NIL
roll-dice
NIL
1
T
OBSERVER
NIL
R
NIL
NIL
1

BUTTON
683
380
748
413
move
go
NIL
1
T
OBSERVER
NIL
M
NIL
NIL
1

BUTTON
686
295
749
328
up
go-up
NIL
1
T
OBSERVER
NIL
W
NIL
NIL
1

BUTTON
685
328
750
361
down
go-down
NIL
1
T
OBSERVER
NIL
S
NIL
NIL
1

BUTTON
623
328
686
361
left
go-left
NIL
1
T
OBSERVER
NIL
A
NIL
NIL
1

BUTTON
749
327
812
360
right
go-right
NIL
1
T
OBSERVER
NIL
D
NIL
NIL
1

TEXTBOX
761
375
911
417
Try not to go into the blacks (you'll waste a forward motion!!!)
11
0.0
1

BUTTON
32
234
138
267
NIL
bag-check
T
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
28
281
144
314
NIL
Price-Check
T
1
T
PATCH
NIL
NIL
NIL
NIL
1

MONITOR
619
33
708
78
$
money-P1
17
1
11

MONITOR
617
84
717
129
$
money-P2
17
1
11

TEXTBOX
612
160
762
216
\"Pick a target place for a good, go there, and sell. Onward!\"\n\t~Experts
11
0.0
1

SWITCH
777
24
880
57
buy
buy
0
1
-1000

BUTTON
776
63
894
96
NIL
buy/sell-olive
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
776
96
893
129
NIL
buy/sell-gold
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
776
128
894
161
NIL
buy/sell-horses
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
776
162
896
195
NIL
buy/sell-silk
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
775
196
897
229
NIL
buy/sell-armour
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

BUTTON
775
231
896
264
NIL
buy/sell-jade
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
717
98
867
116
= yellow
12
0.0
1

TEXTBOX
708
45
858
63
= grey
12
0.0
1

BUTTON
35
397
141
430
Finish
finish-game
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

TEXTBOX
883
38
1033
56
off = sell
11
0.0
1

TEXTBOX
883
26
1033
44
on = buy
11
0.0
1

@#$#@#$#@
## WHAT IS IT?

It's a two-player strategy game. You and your opponent take turns to travel around the Silk Road while going to places to buy stuff for cheap and sell for more somewhere else. The goal is to make the most amount of money before you finish the game.

## HOW IT WORKS

There are 5 trading posts which are: Phoenicia, Rome, China, Central Asia, and India. The two pawns start at two different trading posts which can also be determined by pcolor. Roll the dice and press **m** to move one space. The pawns shouldn't go through the black patches while moving around the map.

## HOW TO USE IT

Players can check their inventory by pressing the **bag-check** button and clicking on a turtle. To determine which posts to go to, they should also press **price-check** and click on a certain trade post.

Once you are at a post and it's your turn, switch the "buy" lever, on and off, to either buy or sell.

Press on the type of specific button to complete buy/sell action while trying to earn the most money at the end. Once you **finish-game**, the player with the most $ will win. 

## THINGS TO NOTICE

How the players start with goods that are cheap at their starting point. This is because their country of origin already has a lot of it. It is important to move around and find a place with more demand. Be patient! 

There is a max-amount of a good you can have in your bag, so try to have a variety of goods that you can sell.

There is no limit to how much you can sell in a turn, unless you run out of items.

## THINGS TO TRY

Agree on the number of turns you will play with your opponent which is counted on the top right.

Once you reach that amount **finish-game**

It goes up one turn after a full rotation when both players roll the dice.

Move to places where the demand is more, hence; it's more profitable.

Have fun!

## EXTENDING THE MODEL

When you press **bag-check**, make your inventory line up the stuff with value greater that 0 on the top, so it's more clear

Make the game automatically finish once the turn count reaches a certain number  

Add traps along the way so the off-roads actually have a meaning

## NETLOGO FEATURES

I used ticks while counting the number of turns. Some of my global variables tend to change value when the turtle does something; so it's interactive.

I gave the turtles and patches a lot of properties that changed.

## RELATED MODELS

It's really similar to the actual Silk Road; China and Rome being the farthest apart.

A Chinese merchant would start with silk but go to Rome where the demand was actually high and vice versa.

Central Asia has a lot of minerals and horses because of the steppes.

India has Jade and Phoenicia has olives because of climate.

While, Rome is industrialized, but everything is more expensive due to an increase in corruption and inflation in the later decades.

## CREDITS AND REFERENCES

Thanks;
Mr. Brooks for helping me transfer what turtles-own and patches-own to plabels through the use of variables
@#$#@#$#@
default
true
0
Polygon -7500403 true true 150 5 40 250 150 205 260 250

airplane
true
0
Polygon -7500403 true true 150 0 135 15 120 60 120 105 15 165 15 195 120 180 135 240 105 270 120 285 150 270 180 285 210 270 165 240 180 180 285 195 285 165 180 105 180 60 165 15

arrow
true
0
Polygon -7500403 true true 150 0 0 150 105 150 105 293 195 293 195 150 300 150

box
false
0
Polygon -7500403 true true 150 285 285 225 285 75 150 135
Polygon -7500403 true true 150 135 15 75 150 15 285 75
Polygon -7500403 true true 15 75 15 225 150 285 150 135
Line -16777216 false 150 285 150 135
Line -16777216 false 150 135 15 75
Line -16777216 false 150 135 285 75

bug
true
0
Circle -7500403 true true 96 182 108
Circle -7500403 true true 110 127 80
Circle -7500403 true true 110 75 80
Line -7500403 true 150 100 80 30
Line -7500403 true 150 100 220 30

butterfly
true
0
Polygon -7500403 true true 150 165 209 199 225 225 225 255 195 270 165 255 150 240
Polygon -7500403 true true 150 165 89 198 75 225 75 255 105 270 135 255 150 240
Polygon -7500403 true true 139 148 100 105 55 90 25 90 10 105 10 135 25 180 40 195 85 194 139 163
Polygon -7500403 true true 162 150 200 105 245 90 275 90 290 105 290 135 275 180 260 195 215 195 162 165
Polygon -16777216 true false 150 255 135 225 120 150 135 120 150 105 165 120 180 150 165 225
Circle -16777216 true false 135 90 30
Line -16777216 false 150 105 195 60
Line -16777216 false 150 105 105 60

car
false
0
Polygon -7500403 true true 300 180 279 164 261 144 240 135 226 132 213 106 203 84 185 63 159 50 135 50 75 60 0 150 0 165 0 225 300 225 300 180
Circle -16777216 true false 180 180 90
Circle -16777216 true false 30 180 90
Polygon -16777216 true false 162 80 132 78 134 135 209 135 194 105 189 96 180 89
Circle -7500403 true true 47 195 58
Circle -7500403 true true 195 195 58

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

face happy
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 255 90 239 62 213 47 191 67 179 90 203 109 218 150 225 192 218 210 203 227 181 251 194 236 217 212 240

face neutral
false
0
Circle -7500403 true true 8 7 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Rectangle -16777216 true false 60 195 240 225

face sad
false
0
Circle -7500403 true true 8 8 285
Circle -16777216 true false 60 75 60
Circle -16777216 true false 180 75 60
Polygon -16777216 true false 150 168 90 184 62 210 47 232 67 244 90 220 109 205 150 198 192 205 210 220 227 242 251 229 236 206 212 183

fish
false
0
Polygon -1 true false 44 131 21 87 15 86 0 120 15 150 0 180 13 214 20 212 45 166
Polygon -1 true false 135 195 119 235 95 218 76 210 46 204 60 165
Polygon -1 true false 75 45 83 77 71 103 86 114 166 78 135 60
Polygon -7500403 true true 30 136 151 77 226 81 280 119 292 146 292 160 287 170 270 195 195 210 151 212 30 166
Circle -16777216 true false 215 106 30

flag
false
0
Rectangle -7500403 true true 60 15 75 300
Polygon -7500403 true true 90 150 270 90 90 30
Line -7500403 true 75 135 90 135
Line -7500403 true 75 45 90 45

flower
false
0
Polygon -10899396 true false 135 120 165 165 180 210 180 240 150 300 165 300 195 240 195 195 165 135
Circle -7500403 true true 85 132 38
Circle -7500403 true true 130 147 38
Circle -7500403 true true 192 85 38
Circle -7500403 true true 85 40 38
Circle -7500403 true true 177 40 38
Circle -7500403 true true 177 132 38
Circle -7500403 true true 70 85 38
Circle -7500403 true true 130 25 38
Circle -7500403 true true 96 51 108
Circle -16777216 true false 113 68 74
Polygon -10899396 true false 189 233 219 188 249 173 279 188 234 218
Polygon -10899396 true false 180 255 150 210 105 210 75 240 135 240

house
false
0
Rectangle -7500403 true true 45 120 255 285
Rectangle -16777216 true false 120 210 180 285
Polygon -7500403 true true 15 120 150 15 285 120
Line -16777216 false 30 120 270 120

leaf
false
0
Polygon -7500403 true true 150 210 135 195 120 210 60 210 30 195 60 180 60 165 15 135 30 120 15 105 40 104 45 90 60 90 90 105 105 120 120 120 105 60 120 60 135 30 150 15 165 30 180 60 195 60 180 120 195 120 210 105 240 90 255 90 263 104 285 105 270 120 285 135 240 165 240 180 270 195 240 210 180 210 165 195
Polygon -7500403 true true 135 195 135 240 120 255 105 255 105 285 135 285 165 240 165 195

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

pentagon
false
0
Polygon -7500403 true true 150 15 15 120 60 285 240 285 285 120

person
false
0
Circle -7500403 true true 110 5 80
Polygon -7500403 true true 105 90 120 195 90 285 105 300 135 300 150 225 165 300 195 300 210 285 180 195 195 90
Rectangle -7500403 true true 127 79 172 94
Polygon -7500403 true true 195 90 240 150 225 180 165 105
Polygon -7500403 true true 105 90 60 150 75 180 135 105

plant
false
0
Rectangle -7500403 true true 135 90 165 300
Polygon -7500403 true true 135 255 90 210 45 195 75 255 135 285
Polygon -7500403 true true 165 255 210 210 255 195 225 255 165 285
Polygon -7500403 true true 135 180 90 135 45 120 75 180 135 210
Polygon -7500403 true true 165 180 165 210 225 180 255 120 210 135
Polygon -7500403 true true 135 105 90 60 45 45 75 105 135 135
Polygon -7500403 true true 165 105 165 135 225 105 255 45 210 60
Polygon -7500403 true true 135 90 120 45 150 15 180 45 165 90

sheep
false
15
Circle -1 true true 203 65 88
Circle -1 true true 70 65 162
Circle -1 true true 150 105 120
Polygon -7500403 true false 218 120 240 165 255 165 278 120
Circle -7500403 true false 214 72 67
Rectangle -1 true true 164 223 179 298
Polygon -1 true true 45 285 30 285 30 240 15 195 45 210
Circle -1 true true 3 83 150
Rectangle -1 true true 65 221 80 296
Polygon -1 true true 195 285 210 285 210 240 240 210 195 210
Polygon -7500403 true false 276 85 285 105 302 99 294 83
Polygon -7500403 true false 219 85 210 105 193 99 201 83

square
false
0
Rectangle -7500403 true true 30 30 270 270

square 2
false
0
Rectangle -7500403 true true 30 30 270 270
Rectangle -16777216 true false 60 60 240 240

star
false
0
Polygon -7500403 true true 151 1 185 108 298 108 207 175 242 282 151 216 59 282 94 175 3 108 116 108

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

tree
false
0
Circle -7500403 true true 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -7500403 true true 65 21 108
Circle -7500403 true true 116 41 127
Circle -7500403 true true 45 90 120
Circle -7500403 true true 104 74 152

triangle
false
0
Polygon -7500403 true true 150 30 15 255 285 255

triangle 2
false
0
Polygon -7500403 true true 150 30 15 255 285 255
Polygon -16777216 true false 151 99 225 223 75 224

truck
false
0
Rectangle -7500403 true true 4 45 195 187
Polygon -7500403 true true 296 193 296 150 259 134 244 104 208 104 207 194
Rectangle -1 true false 195 60 195 105
Polygon -16777216 true false 238 112 252 141 219 141 218 112
Circle -16777216 true false 234 174 42
Rectangle -7500403 true true 181 185 214 194
Circle -16777216 true false 144 174 42
Circle -16777216 true false 24 174 42
Circle -7500403 false true 24 174 42
Circle -7500403 false true 144 174 42
Circle -7500403 false true 234 174 42

turtle
true
0
Polygon -10899396 true false 215 204 240 233 246 254 228 266 215 252 193 210
Polygon -10899396 true false 195 90 225 75 245 75 260 89 269 108 261 124 240 105 225 105 210 105
Polygon -10899396 true false 105 90 75 75 55 75 40 89 31 108 39 124 60 105 75 105 90 105
Polygon -10899396 true false 132 85 134 64 107 51 108 17 150 2 192 18 192 52 169 65 172 87
Polygon -10899396 true false 85 204 60 233 54 254 72 266 85 252 107 210
Polygon -7500403 true true 119 75 179 75 209 101 224 135 220 225 175 261 128 261 81 224 74 135 88 99

wheel
false
0
Circle -7500403 true true 3 3 294
Circle -16777216 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -7500403 true 216 40 79 269
Line -7500403 true 40 84 269 221
Line -7500403 true 40 216 269 79
Line -7500403 true 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
false
0
Polygon -2674135 true false 270 75 225 30 30 225 75 270
Polygon -2674135 true false 30 75 75 30 270 225 225 270
@#$#@#$#@
NetLogo 6.1.1
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
@#$#@#$#@
default
0.0
-0.2 0 0.0 1.0
0.0 1 1.0 0.0
0.2 0 0.0 1.0
link direction
true
0
Line -7500403 true 150 150 90 180
Line -7500403 true 150 150 210 180
@#$#@#$#@
0
@#$#@#$#@
