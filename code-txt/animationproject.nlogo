to say [what delay]
  ask patches [set plabel ""]
  ask patch 13 15 [set plabel what
    set plabel-color red]
    wait delay
end
to blurt [what delay]
  ask patches [set plabel ""]
  ask patch 16 10[
    set plabel what
      set plabel-color orange]
  wait delay
end
to yell [what delay]
  ask patches [set plabel ""]
ask patch 0 15 [set plabel what
    set plabel-color cyan]
  wait delay
end
to burn
  set heading 90
  pd repeat 180 [lt 1 fd (pi * 1.5) / 360 wait 0.001]
  set heading 270 repeat 180 [rt 1 fd (pi * 1.5) / 360 wait 0.001]
  set heading 0 repeat 10 [fd 0.1 wait 0.001]
  die
end
to start
  ca
  ask patches with [pxcor = -3 AND pycor = 9]
  [set plabel "Mushroom's"
    repeat 250 [set plabel-color one-of [green blue] wait 0.01]
  ]
  wait .3
  ask patches  with [pxcor = -3 AND pycor = 7]
  [set plabel "LEAUGE"
    repeat 250 [set plabel-color one-of [red yellow] wait 0.01]
  ]
end
to mantar
  crt 1
  [setxy 8 7
    set shape "mantar"
    set size 14
  set color grey
  set heading 335] wait .5
  ask turtles [while [size < 25] [every 0.1 [set size (size + 1)
    set color (color - 0.3)]
    repeat 51 [set heading (heading + 1) wait .001]
    ]
  ] wait 1
  ask turtles [die]
    wait 1
  crt 5 [set shape "dot"
    set color grey
    setxy 8 7
  set size 3]
  ask turtles with [who = 5] [set heading 0]
  ask turtles with [who = 1] [set heading 72]
  ask turtles with [who = 2] [set heading 144]
  ask turtles with [who = 3] [set heading 216]
  ask turtles with [who = 4] [set heading 288]
    ask turtles [set size 4 set color red]
  ask-concurrent turtles [repeat 20 [fd 0.1 wait 0.1]]
end
to explode
  ask-concurrent turtles [repeat 20 [fd 0.1 set size (size + 0.05) wait 0.01]]
  wait 1
  ask turtles [hatch 2 [set shape "ball"
    set color sky
    set size 3]
  ]
    ask-concurrent turtles with [who > 5] [repeat 20 [fd .1 rt 45 lt 45 wait .01]
   ]

  wait .5

crt 1 [ set shape "explosion"
    setxy 8 7
    set size 10
  set color orange]

  ask turtles with [shape = "explosion"] [while [size < 16] [every .01 [set size (size + 1)
    wait 0.01]
    ]
  ]

  ask-concurrent turtles with [who != 16] [repeat 10 [fd 0.1 rt 45 lt 45 wait .01]
    wait 0.5]

  ask-concurrent turtles with [who <= 5] [repeat 10 [set color (color - .2) set size (size - 0.3) wait .2
    rt random 15 lt random 15]
  ]
  ask-concurrent turtles with [who <= 5] [die]

  wait .2
  ask turtles with [shape = "explosion"] [repeat 10 [set color (color + .5) set size (size - .5)
   wait .1]]
  wait .5
  ask turtles with [shape = "explosion"] [die]

  wait .5

  ask-concurrent turtles [repeat 10 [rt random 180
      lt random 180
    fd .1
    wait .01]
  ]

  wait .2

  ask-concurrent turtles
  [repeat 20 [rt random 30
    lt random 30
    fd .2
    wait .01]
  ]
  wait .5

  ask turtles with [who > 6] [set color (color - 2)]
 wait .5
  ask turtles with [who > 6] [set color (color - 2)]
  wait .5
  ask turtles with [who > 6] [die]
  ask turtles with [who = 6] [facexy 0 -8]
end

to feather-fall
  ask turtles [while [pycor > -13] [ every 0.01 [
      set heading 180
    rt random 30
    lt random 10
    fd 1
    wait .05]
 every 0.01 [
      set heading 180
    rt random 10
    lt random 30
    fd 1
    wait .05]
  if pycor <= -13 [ stop ] ]
  ]
  wait .5
end
to building
  cp
ask turtles [setxy 0 -13
    set heading 270
    set shape "dot"
    pd]
  wait .5
   ask turtles [set color red
    fd 33]
  wait .5
  ask turtles [setxy 0 -13]
  ask turtles [pu
    set shape "galata tower"
    set size 20
    set heading 0
    fd 6.7]
  wait .5
  ask patches [if pycor mod 2 = 0 and pycor <= -13 and pxcor mod 2 = 0 [set pcolor yellow]]
  ask patches [if pycor <= -13 and pcolor != yellow [set pcolor red]]
  wait 1
  ask patches with [pxcor = 0 AND pycor = 13] [set plabel "Presents"]
  wait 1
  ask patches with [pxcor = 8 And pycor = 10] [set plabel "The Champions Leauge"]
  wait 2
  ask patches with [pxcor = 13 AND pycor = 5] [set plabel "in Istanbul"]
  wait 2.5
  ask patches with [pxcor = -3 AND pycor = 13] [set plabel ""]
  wait 1
  ask patches with [pxcor = 9 And pycor = 10] [set plabel ""]
  cp
end
to bus-scene
  ca
  crt 1 [
    set size 25
    set shape "lise"
  set heading 0]
  ask patches with [pycor < 3 And pycor > -8] [set pcolor 66]
  ask patches with [pycor = -12] [set pcolor yellow]
  wait .1
  crt 1 [setxy 10 -13
    set size 15
    set shape "bus"
  set heading 0]
  crt 1 [setxy 8 -15
    set color red
    set shape "wheel"
  set size 2.5]
  crt 1 [set shape "wheel"
    set color red
    set size 2.5
    setxy 13.5 -15
  ]
  ask patches with [pycor > 2 AND pcolor != 66] [set pcolor sky]
  crt 1 [set size 5
    set shape "cloud"
    set heading 0
  setxy -5 13]
   crt 1 [set size 5
    set shape "cloud"
    set heading 0
  setxy 13 5]

  wait 1

 say "Meanwhile at the Galatasaray" 3
 say "headquarters before the match" 2

  Ask-concurrent turtles with [who > 0 AND who < 4]
  [repeat 130 [set xcor (xcor - .1)
    set heading (heading - (360 * 0.1 / pi * 2 * 1.25)) wait .01]]
  wait .5
  say "A PSG bus shows up" 2.5
  say "**skrrrrtt skrrrtttt**" 2
   say "**honk honk**" 2
  say "challenging the home team" 2
  say "for a soccer match" 2
  crt 1 [set heading 0
    set shape "pole"
    set color grey
    set size 10
    setxy 7 10]
 wait .5

  crt 1 [set shape "triangle"
    set heading 0
    set color white
    set size .5
    setxy 7.3 8.5]

  Ask turtles with [who = 7]
  [while [ycor < 11] [every .05 [set ycor ycor + 0.1
    set size (size + 0.2)
    set xcor (xcor + .06)
    wait .1]
    ] if ycor >= 12 [stop]
    ]
  wait .5
say "the home team..." 1

  say "Galatasaray **thinking**" 2
  say "very hard..." 2


  ask turtles with [who = 7] [repeat 300 [rt random 360
    fd .03
    wait .01]
  set ycor 11.4
  set xcor 9]

  say "accepts that challenge" 2

  ask turtles with [who = 1] [repeat 150 [fd 0.1 wait 0.01 bk 0.1 wait 0.01]]

  crt 1 [set size 2 set shape "car cloud" setxy 4 -14 set color grey set heading 0]
  ask turtles with [who = 8] [repeat 20 [set xcor (xcor + 0.02) set size (size + 0.2) wait 0.08]
    set color black wait 0.5
    set color grey wait 0.2
  die]

  Ask-concurrent turtles with [who > 0 AND who < 4]
    [repeat 130 [set xcor (xcor + .1)
    set heading (heading + (360 * 0.1 / pi * 2 * 1.25)) wait .01]]

  Ask-concurrent turtles with [who > 0 AND who < 4]
    [repeat 20 [set xcor (xcor - .1)
    set heading (heading - (360 * 0.1 / pi * 2 * 1.25)) wait .01]]

  Ask-concurrent turtles with [who > 0 AND who < 4]
    [repeat 25 [set xcor (xcor + .1)
    set heading (heading + (360 * 0.1 / pi * 2 * 1.25)) wait .02]]

  wait 0.2
  say "the PSG bus" 1
  Ask-concurrent turtles with [who > 0 AND who < 4]
    [repeat 250 [set xcor (xcor - .1)
    set heading (heading - (360 * 0.1 / pi * 2 * 1.25)) wait .01]
     die]

  say ".... drives off" 2
  say "after placing its players in the" 2
  say "headquarters" 2
end
to playoff
  ca
  say "hi i am" 1
  say "the narrator" 2
  say "welcome back folks" 3
  ask patches with [pycor > -11] [set pcolor 49]
  ask patches with [pycor < -11 AND pycor > -16 AND pxcor > -8 AND pxcor < 9] [set pcolor green]
  crt 1 [setxy 0 -11.6 set heading 180 pd set color white set pen-size 2
    fd 3.8
  set heading 0
  fd 3.2
  set heading 90
  repeat 360 [rt 1
      fd (1.25 * pi) / 180]
  die]
  crt 1 [setxy -7.5 -12 set heading 90 pd set color white set pen-size 2
    repeat 3 [fd 3 rt 90]
  die]
  crt 1 [setxy 8.5 -12 set heading 270 pd set color white set pen-size 2
    repeat 3 [fd 3 lt 90]
  die]
  crt 1 [set heading 0 set size 8 setxy -11 10 set shape "triangle" set color black]
  ask patch -5 -14.7 [sprout 1 [set color red set heading 29 set shape "x"]]
  crt 1 [set heading 330 set shape "atak" set size 3 setxy -1 -13]
  say "inside the HQ" 3
  say "the two managers" 2
say "are supposed to" 2
  say "meet before the match" 2
  crt 1 [set shape "galatasaray mng" set heading 0 setxy 13 4 set size 9]
  crt 1 [set shape "suit" set heading 0 setxy 13 -1.69 set size 13]
  crt 1 [set shape "leg" set heading 0 setxy 11 -7.8 set size 5]
  crt 1 [set shape "leg" set heading 0 setxy 14 -7.8 set size 5]
  crt 1 [set shape "shoe" set heading 0 setxy 10 -9.5 set size 9]
  crt 1 [set shape "shoe" set heading 0 setxy 13 -9.5 set size 9]
  say "well at least one..." 2
  say "is here" 2
  blurt "well, here is my stadium" 2
   crt 1 [set shape "table" set size 12 setxy -2 -5.69 set heading 0]
  say "here is his stadium" 2

  crt 1 [set shape "teleporter" set heading 0 set size 6 set color grey setxy -14 -7]

  ask turtles with [who = 13] [while [ycor < 8] [set xcor (xcor + 0.1) set ycor (ycor + 0.3)
    set heading (heading + 5) wait 0.01]
    while [ycor > -3] [set xcor (xcor + 0.1) set ycor (ycor - 0.3)
      set heading (heading + 5) wait 0.01 if ycor <= -3 [stop]]
  ]
  ask turtles with [who = 13] [repeat 10 [set ycor (ycor + 0.1) wait 0.01]]
  say "oh noooo" .2
   ask turtles with [who = 13] [while [ycor < 8] [set xcor (xcor - 0.05) set ycor (ycor + 0.2)
    set heading (heading - 9) wait 0.05]
  ]
  say "nooooo" .2
  ask turtles with [who = 13] [repeat 270 [set heading (heading - 5) wait 0.01]]
  ask turtles with [who = 13] [while [ycor > -10] [set ycor (ycor - 0.1) set xcor (xcor - 0.02)
    set heading (heading - 5)   wait 0.01]
  ]
  ask turtles with [shape = "teleporter"] [repeat 50 [set heading random 360 fd 0.1 bk 0.1 wait 0.01]
  ]
  ask turtles with [shape = "teleporter"] [repeat 20 [set heading random 360 fd 0.05 bk 0.05 wait 0.06]
  set heading 0]
  wait 1
  blurt "was that an" 2
  blurt "assasination" 1
  blurt "attempt?" 2
  blurt "*must not show fear*" 2
  Ask turtle 13 [hatch 1 [set shape "psg menager" set ycor (ycor + 2)]]
  Ask turtle 14 [while [ycor < 4] [set ycor (ycor + 0.01) wait 0.001]
  ]
  blurt "what the hell" 2
  yell "bow" 2
  yell "hello"2
  blurt "hi, creature" 2
  yell "hi" 2
  yell "why you gotta be" 1
  yell "so ruuudee?" 2
  blurt "omg, you can ss.." 2
  blurt "speak" 2
  yell "well" 2
  yell "no sh••" 1.5
  yell "i am PSG's" 1.5
  yell "head coach" 1.5
  crt 1 [set shape "dot" set color 8 setxy 12 4]
  ask turtle 15 [repeat 7 [set color (color + 1) wait 0.1]]
  blurt "did you just say" 2
  yell "oh no..." 1.5
  blurt "headcoach" 2
  yell "yes...?" 1.5
  blurt "WELCOME" 1.5
  blurt "to my jungle"2
  ask turtle 6 [repeat 5 [set heading (heading - 5) wait 0.3]
  set heading (heading + 5)]
  ask turtle 15 [hatch 1 [set shape "dot" set color red set heading 240]]
    ask turtle 16 [pd
      set pen-size 5
      while [ycor > -4] [fd 0.01 wait 0.001]
  ]

  repeat 5 [crt 1 [setxy -2.75 -3
   set color black set pen-size .5
    set shape "dot" set size .5
    burn]
    crt 1 [setxy -1.5  -3 set color black set pen-size .5
    set shape "dot" set size .5
    burn]
  ]
    yell "ok" 2
  yell "impressive" 1.5
    yell "stop now" 1
  repeat 2 [crt 1 [setxy -2.75 -3
   set color black set pen-size .5
    set shape "dot" set size .5
    burn]
    crt 1 [setxy -1.5  -3 set color black set pen-size .5
    set shape "dot" set size .5
    burn]
  ]
end

to match
  ca
  say "the two menagers" 2
  say "and their armies" 1.5
  say "excuse me" 0.5
  say "soccer players" 2
  say "will meet on the" 2
  ask patches with [pycor < 6 AND pycor > -11 AND pxcor > -15 AND pxcor < 15] [ifelse pxcor = 14 or pxcor
    = 13 or pxcor = 12 or pxcor = 11 or pxcor = 10 or pxcor = 4 or pxcor = 3 or pxcor = 2 or pxcor = 1 or pxcor = 0
   or pxcor = -6 or pxcor = -7 or pxcor = -8 or pxcor = -9 or pxcor = -10 [set pcolor 62] [set pcolor 63]
  ]
  say "turf" .4
  crt 1 [setxy -14.3 -10.69 set heading 0 pd set color white set pen-size 4
    repeat 2 [fd 16 rt 90 fd 29 rt 90]
  die]
  crt 1 [setxy 0 -10.69 set heading 0 pd set color white set pen-size 4
    fd 16 set heading 180 fd 3 set heading 90 repeat 360 [rt 1 fd (pi * 10 / 360)] die]
  crt 1 [set heading 0 setxy -13 -2.5 set size 3 set shape "player 2"]
  crt 1 [set heading 0 setxy -2 3 set size 3 set shape "player 2"]
  crt 1 [set heading 0 setxy -5 -3  set size 3 set shape "player 2"]
  crt 1 [set heading 0 setxy -2 -9 set size 3 set shape "player 2"]
  crt 1 [set heading 0 setxy -9 2 set size 3 set shape "player 2"]
  crt 1 [set heading 0 setxy -9 -3 set size 3 set shape "player 2"]
  crt 1 [set heading 0 setxy -9 -8 set size 3 set shape "player 2"]
  say "the PSG players take place" 3
  yell "ha ha" 1.5
  yell "you think you have a chance" 2
  yell "against my team" 2
  crt 1 [set heading 0 setxy 13.5 -3 set size 3 set shape "player 1"]
  crt 1 [set heading 0 setxy 9 3 set size 3 set shape "player 1"]
  crt 1 [set heading 0 setxy 9 -3 set size 3 set shape "player 1"]
  crt 1 [set heading 0 setxy 9 -9 set size 3 set shape "player 1"]
  crt 1 [set heading 0 setxy 1 3 set size 3 set shape "player 1"]
  crt 1 [set heading 0 setxy 3 -3 set size 3 set shape "player 1"]
  crt 1 [set heading 0 setxy 1 -9 set size 3 set shape "player 1"]
  blurt "yes I do" 3.5
  ask turtle 14 [hatch 1 [set shape "ball" set size 2 set heading 350 set color sky]]
  ask turtle 16 [repeat 50 [fd 0.1 wait 0.01]]
  ask turtle 16 [while [not any? turtles-on turtle 13] [fd 0.1 wait 0.01
      if any? turtles-on turtle 13 [stop]]
  face turtle 11
    repeat 50 [fd 0.1 wait 0.01]]
  ask turtle 16 [while [count turtles-on turtle 11 = 1] [fd 0.1 wait 0.01
      if count turtles-on turtle 11 = 2 [stop]]
  ]
  ask turtle 16 [face turtle 10
    while [count turtles-on turtle 10 = 1] [fd 0.1 wait 0.01
      if count turtles-on turtle 10 = 2 [stop]]
  ]
  ask turtle 16 [face turtle 14
    while [count turtles-on turtle 14 = 1] [fd 0.1 wait 0.01
      if count turtles-on turtle 11 = 2 [stop]]
  ]
  ask turtle 16 [face turtle 10
    while [count turtles-on turtle 10 = 1] [fd 0.1 wait 0.01
      if count turtles-on turtle 10 = 2 [stop]]
  ]
  ask turtle 16 [face turtle 11
    while [count turtles-on turtle 11 = 1] [fd 0.1 wait 0.01
      if count turtles-on turtle 11 = 2 [stop]]
  ]
  ask turtle 16 [face turtle 14
    while [count turtles-on turtle 14 = 1] [fd 0.1 wait 0.01
      if count turtles-on turtle 14 = 2 [stop]]
  ]
  say "after a prelonged tiki-taka" 2
  say "ball movement" 1.5
  say "Galatasaray is dominating" 3
  ask turtle 16 [repeat 20 [set xcor (xcor - .1) wait 0.01]
  ]
  say "but the score is still" 1.5
  say "tied 0-0" 2
  ask turtle 16 [set heading 315 repeat 40 [fd 0.1 wait 0.01]
  ]
  ask turtle 14 [set heading 315 repeat 40 [fd 0.1 wait 0.01]
  ]
  wait 0.5
  say "but no. 9 penetrates!!" 2
  say "deep into opposing" 1.5
  say "territory" 1
  ask turtle 16 [set heading 270 repeat 15 [fd 0.1 wait 0.01]
  ]
  ask turtle 14 [set heading 270 repeat 15 [fd 0.1 wait 0.01]
  ]
  say "he strikesss!!" 1
  ask turtle 16 [repeat 40 [rt 1 fd ((pi * 17) / 360) wait 0.01]
  ]
   ask turtle 16 [repeat 80 [lt 1 fd ((pi * 10) / 360) wait 0.01]
  ]
  say "and" 0.5
  ask turtle 16 [repeat 300 [set heading (heading + 5) wait 0.01]]
  say "A GOALLLLLL!" 2
  say "Mesut strikes" 0.9
  say "beautifully" 1
  blurt "yess Goal" 1
  say "and the final whistle" 1
  say "blows" 1
  cp wait 0.5
  say "Galatasaray are finally" 2
  say "THE CHAMPIONS" 5
  ct
  crt 1 [set heading 0
    set size 5
    set color grey
    set shape "cup"]
  ask turtle 0 [repeat 30 [set size (size + 1) wait 0.1]
  ]
  wait 3
  ca
  say "That's All" 2
  say "folks" 1
  blurt "oh yeahhh" 3
end
 to
 go
 start
  wait .5
  mantar
  wait .5
  explode
  wait .5
  feather-fall
  building
  wait .1
  bus-scene
  wait .5
  playoff
  wait .4
  match
end
@#$#@#$#@
GRAPHICS-WINDOW
210
10
647
448
-1
-1
13.0
1
25
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
59
127
122
160
NIL
go
NIL
1
T
OBSERVER
NIL
NIL
NIL
NIL
1

@#$#@#$#@
## WHAT IS IT?

(a general understanding of what the model is trying to show or explain)

## HOW IT WORKS

(what rules the agents use to create the overall behavior of the model)

## HOW TO USE IT

(how to use the model, including a description of each of the items in the Interface tab)

## THINGS TO NOTICE

(suggested things for the user to notice while running the model)

## THINGS TO TRY

(suggested things for the user to try to do (move sliders, switches, etc.) with the model)

## EXTENDING THE MODEL

(suggested things to add or change in the Code tab to make the model more complicated, detailed, accurate, etc.)

## NETLOGO FEATURES

(interesting or unusual features of NetLogo that the model uses, particularly in the Code tab; or where workarounds were needed for missing features)

## RELATED MODELS

(models in the NetLogo Models Library and elsewhere which are of related interest)

## CREDITS AND REFERENCES

(a reference to the model's URL on the web if it has one, as well as any other necessary credits, citations, and links)
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

atak
true
0
Polygon -2674135 true false 37 243 18 142 92 216 80 224 51 196 41 202 48 244 36 244 34 220
Polygon -10899396 true false 27 171 33 191 44 183 27 171
Polygon -2674135 true false 39 133 88 87 104 107 79 126 128 187 109 203 68 137 47 152 40 133
Polygon -2674135 true false 106 83 175 51 178 78 147 89 172 174 155 178 136 95 110 103 108 83
Polygon -2674135 true false 46 204
Polygon -2674135 true false 194 187 181 178 214 67 225 202 212 200 211 161 199 161 193 187
Polygon -10899396 true false 211 137 197 136 208 115 211 140
Polygon -2674135 true false 275 108 228 211 242 218 258 184 263 233 277 228 271 164 296 149 293 128 272 146 285 109 274 107 270 118
Polygon -2674135 true false 55 260 92 236 113 228 144 218 175 212 194 216 216 231 247 250 261 239 243 231 212 210 189 200 156 195 121 207 102 217 82 228 60 240 48 252 59 260

ball
true
9
Circle -13791810 false true 58 64 168
Polygon -13791810 true true 144 129
Polygon -13791810 true true 164 166 132 166 124 145 143 123 171 139 164 167
Polygon -13791810 false true 142 126 136 101 107 92 88 114 92 145 124 147
Polygon -13791810 false true 133 169 121 192 89 187 84 166 93 145 125 146 133 168
Polygon -13791810 false true 135 101 160 83 191 103 187 134 166 141 143 124
Polygon -13791810 false true 159 166
Polygon -13791810 false true 163 168 179 184 197 171 200 149 185 134 170 142 162 169
Polygon -13791810 false true 120 190 143 218
Polygon -13791810 false true 121 192 143 216 168 211 177 184 164 166 134 167
Polygon -13791810 true true 161 83 154 63 110 70 109 92 135 101 159 83
Polygon -13791810 false true 192 104 221 104
Polygon -13791810 true true 200 149 229 142 222 106 190 104 186 132 201 152
Polygon -13791810 false true 198 174 217 191 195 172
Polygon -13791810 true true 168 211 191 220 216 189 194 171 179 183 169 211 193 221
Polygon -13791810 false true 142 217 133 233
Polygon -13791810 true true 92 189 85 215 132 234 142 216 121 191 90 189 86 216
Polygon -13791810 false true 81 169
Polygon -13791810 false true 83 167 60 160
Polygon -13791810 true true 58 160 85 168 93 143 88 115 65 115 56 141 60 163

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

bus
false
0
Polygon -7500403 false true 42 68
Polygon -13345367 true false 40 90 40 191 94 191 104 180 121 179 133 195 135 181 186 181 204 181 205 196 214 179 238 179 243 192 269 192 267 78 39 79 42 104
Rectangle -1 true false 41 81 74 138
Polygon -2674135 true false 100 96 101 162 113 163 111 126 136 125 134 93 100 94 100 112
Polygon -13345367 true false 124 107 125 116 112 115 112 105 125 106 125 113
Polygon -2674135 true false 184 92 140 92 142 124 180 124 178 157 136 154 137 168 195 165 193 114 156 113 156 104 192 102 190 92 172 90
Polygon -2674135 true false 248 94 202 94 201 163 260 161 257 129 217 130 218 140 247 137 244 156 210 152 212 103 252 103 252 93 241 94

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

car cloud
true
0
Circle -7500403 true true 143 79 68
Circle -7500403 true true 153 115 72
Circle -7500403 true true 138 149 70
Polygon -7500403 true true 141 179 125 167 109 164 102 162 95 162 78 161 84 148 80 145 85 141 79 135 89 126 80 115 89 111 102 111 108 112 112 114 119 115 127 115 144 117 153 115 160 127 163 142 162 160 153 181 138 177 127 170

circle
false
0
Circle -7500403 true true 0 0 300

circle 2
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240

cloud
true
0
Circle -1 true false 11 82 128
Circle -1 true false 72 61 150
Circle -1 true false 173 81 87
Circle -1 true false 147 104 118

cow
false
0
Polygon -7500403 true true 200 193 197 249 179 249 177 196 166 187 140 189 93 191 78 179 72 211 49 209 48 181 37 149 25 120 25 89 45 72 103 84 179 75 198 76 252 64 272 81 293 103 285 121 255 121 242 118 224 167
Polygon -7500403 true true 73 210 86 251 62 249 48 208
Polygon -7500403 true true 25 114 16 195 9 204 23 213 25 200 39 123

cup
true
0
Polygon -7500403 true true 192 274 148 274 126 274 106 269 113 262 129 260 145 258 144 242 143 227 139 214 134 204 125 194 119 187 110 175 106 160 101 137 91 116 92 93 109 92 117 91 130 91 141 89 156 89 165 87 189 88 198 88 205 94 209 99 208 106 208 113 210 123 210 137 210 147 207 157 204 164 200 169 192 176 186 182 174 193 163 206 158 223 157 245 158 253 173 259 186 264 191 271 179 274
Polygon -2674135 true false 173 117 173 134 164 129 150 129 143 141 143 157 151 166 168 168 170 159 169 156 157 156 157 147 179 149 177 163 170 175 155 175 142 170 134 151 134 134 138 122 156 118 169 117 174 118
Polygon -1184463 true false 172 108 160 112 153 104 143 108 141 116 144 128 152 137 160 140 171 149 159 150 146 140 138 131 135 112 136 106 144 97 153 95 161 97 172 108
Polygon -1184463 true false 161 157 163 163 156 163 149 156 147 163 165 169 169 165 169 160 169 155 161 156
Polygon -7500403 true true 93 107 80 122 77 135 74 147 74 162 79 179 87 186 99 187 112 187 126 187 122 176 106 179 92 178 86 164 84 149 84 141 85 133 91 123 97 115
Polygon -7500403 true true 207 107 217 108 225 114 229 124 233 139 234 160 234 177 230 186 214 188 203 188 190 182 188 174 195 168 200 175 212 177 217 177 225 176 226 164 226 150 225 136 221 128 211 114 198 113

cylinder
false
0
Circle -7500403 true true 0 0 300

dot
false
0
Circle -7500403 true true 90 90 120

explosion
true
2
Polygon -2674135 true false 149 207 135 181 122 184 123 163 103 151 122 132 119 111 141 118 149 94 171 134 203 122 177 158 189 171 166 172 169 197 152 183 149 208
Polygon -2674135 true false 120 144
Polygon -955883 true true 158 175 163 186 147 175 145 182 140 177 128 174 130 159 117 147 131 141 126 123 142 132 150 111 157 135 185 136 166 158 179 167 160 165 160 179
Polygon -1 true false 144 147 139 142 146 144 148 137 151 149 158 150 148 155 148 160 144 153 137 152 144 147

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

galata tower
true
0
Polygon -6459832 true false 118 257 117 102 176 101 175 251 118 252
Rectangle -16777216 true false 110 141 182 144
Rectangle -16777216 true false 117 122 176 125
Rectangle -7500403 true true 120 135 135 135
Rectangle -2674135 true false 123 124 133 142
Rectangle -2674135 true false 140 125 150 143
Rectangle -2674135 true false 159 124 167 143
Polygon -6459832 true false 106 110
Polygon -6459832 true false 114 106 146 47 180 107
Rectangle -16777216 true false 107 103 187 110
Polygon -1184463 true false 142 61 120 98
Polygon -1184463 true false 143 56 122 99
Polygon -1184463 true false 143 56 122 96 141 60
Polygon -1184463 true false 123 100 141 59 144 62 126 102
Polygon -1184463 true false 168 99 150 58 147 61 165 101
Polygon -1184463 true false 150 101 148 61 144 60 140 101
Circle -2674135 true false 141 40 11

galatasaray mng
true
0
Circle -2064490 true false 95 104 100
Polygon -2674135 true false 110 180 121 173 118 186 107 187 103 179 114 177
Circle -6459832 true false 110 134 11
Polygon -1184463 true false 105 120 90 90 120 105 120 75 135 90 150 105 165 75 165 105 180 90 180 120 105 120
Circle -2674135 true false 77 77 16
Circle -2674135 true false 108 59 17
Circle -2674135 true false 158 60 18
Circle -2674135 true false 179 79 12

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

leg
true
0
Rectangle -6459832 true false 108 17 192 267

line
true
0
Line -7500403 true 150 0 150 300

line half
true
0
Line -7500403 true 150 0 150 150

lise
true
0
Polygon -6459832 false false 30 204 31 63 267 63 267 219 30 220
Polygon -1184463 true false 36 89
Polygon -1184463 true false 39 93 39 203
Polygon -1184463 true false 46 96
Polygon -1184463 true false 150 107 194 27
Polygon -1184463 true false 37 69 36 214 261 212 259 69 36 68
Polygon -2674135 true false 32 63 75 29 225 28 266 63
Rectangle -1 true false 113 85 117 138
Rectangle -1 true false 158 81 165 145
Rectangle -1 true false 176 84 180 140
Rectangle -1 true false 129 81 135 144
Rectangle -11221820 true false 195 89 209 129
Rectangle -11221820 true false 85 90 99 130
Rectangle -11221820 true false 223 90 237 130
Rectangle -11221820 true false 51 89 65 129
Circle -1 true false 127 47 40
Line -16777216 false 146 67 158 55
Line -16777216 false 147 67 139 62
Line -16777216 false 165 67 157 67
Line -16777216 false 147 49 147 57
Line -16777216 false 130 67 137 67
Line -16777216 false 147 78 147 85
Rectangle -6459832 true false 133 173 161 213
Circle -16777216 true false 133 191 6

mantar
true
0
Rectangle -7500403 true true 118 122 184 226
Polygon -7500403 true true 118 124 95 124 92 144 70 141 65 134 61 118 59 107 59 94 61 83 68 67 75 58 82 50 94 42 111 39 124 36 137 36 150 36 166 35 182 35 196 37 204 40 213 47 226 62 231 74 234 90 238 106 241 128 238 135 229 135 217 135 207 122 200 122 191 123 183 124 177 125
Polygon -16777216 true false 94 78 107 83 112 88 116 93 119 103 122 115
Polygon -16777216 true false 119 74 128 86 130 96 131 101 131 109
Polygon -16777216 true false 138 63 141 76 143 87 143 94 143 102 143 107
Polygon -16777216 true false 156 67 158 81 159 92 159 98 157 105
Polygon -16777216 true false 169 61 173 79 173 85 170 96 165 112
Polygon -16777216 true false 192 95 185 100 178 107 173 117 171 122

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

player 1
true
0
Circle -1184463 true false 62 54 180
Rectangle -2674135 true false 64 129 239 164
Polygon -2674135 true false 63 131 59 144 59 152 64 165 64 132
Polygon -2674135 true false 239 164 243 157 244 142 244 136 240 128

player 2
true
0
Circle -13345367 true false 62 55 182
Rectangle -2674135 true false 69 135 238 161
Polygon -2674135 true false 69 134 60 141 61 155 70 162
Polygon -2674135 true false 237 163 241 161 244 159 247 154 247 147 247 138 242 135 235 137

pole
true
0
Rectangle -7500403 true true 144 69 153 251

psg menager
true
0
Circle -6459832 true false 90 86 110
Circle -16777216 true false 162 118 12
Polygon -2064490 true false 175 184 164 186 161 185 154 181 151 178 152 176 152 171 167 173 176 173 181 174 187 174 172 190 164 186
Polygon -2674135 true false 180 105 195 90 180 90 180 90 165 90 165 75 150 75 120 75 135 75 105 90 105 105 75 105 105 120 180 105

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

shoe
false
0
Polygon -7500403 true true 206 201 185 201 130 201 115 200 107 200 115 184 134 179 153 179 171 173 180 167 199 173 213 171 213 191 213 203 197 201
Rectangle -16777216 true false 133 186 137 198
Rectangle -16777216 true false 146 183 151 198
Rectangle -16777216 true false 159 180 164 198

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

suit
false
0
Polygon -2674135 true false 210 244 81 244 74 235 72 225 71 202 71 188 72 173 73 156 74 143 76 115 79 99 85 82 90 70 100 60 133 59 145 60 171 60 195 65 202 74 210 245
Rectangle -1184463 true false 163 66 178 239
Rectangle -1184463 true false 138 65 150 238
Rectangle -1184463 true false 112 67 124 236
Polygon -2674135 true false 48 186 98 156 100 183 38 222 35 189 59 180
Circle -1184463 true false 13 188 35
Polygon -16777216 false false 158 146 170 162 177 168 184 184 156 208 167 222 214 178 174 111 151 141 165 156
Polygon -16777216 false false 149 196 157 209 169 220 176 225 154 231 140 217 149 198
Line -16777216 false 77 226 87 239
Line -16777216 false 15 204 23 210
Line -16777216 false 20 199 30 208
Line -16777216 false 27 194 35 204

table
true
0
Polygon -6459832 true false 31 263 32 263 43 267 47 267 53 254 53 238 50 221 46 200 43 184 36 160 32 141 54 141 59 159 61 172 63 191 65 217 66 233 69 256 67 272 55 278 36 275 26 264 32 261
Rectangle -13840069 true false 32 115 262 141
Rectangle -6459832 true false 33 123 262 132
Polygon -6459832 true false 225 143 222 160 221 169 221 179 221 188 220 203 220 218 220 233 220 246 223 256 228 266 238 276 248 277 260 274 267 260 253 257 247 266 243 257 240 248 238 225 239 213 239 194 242 175 245 161 249 147 251 140 227 141 227 146

target
false
0
Circle -7500403 true true 0 0 300
Circle -16777216 true false 30 30 240
Circle -7500403 true true 60 60 180
Circle -16777216 true false 90 90 120
Circle -7500403 true true 120 120 60

teleporter
true
0
Polygon -7500403 true true 204 137 181 131 162 131 149 131 122 131 107 132 95 140 89 151 95 163 123 164 149 164 180 163 206 155 209 141 197 135 185 132
Polygon -14835848 true false 216 152 211 130 179 119 153 119 119 117 92 126 77 135 73 156 75 177 121 183 161 181 198 178 221 164 210 131 227 109 199 91 180 84 148 80 116 82 90 90 60 105 45 120 45 150 57 193 95 208 163 208 202 201 234 186 246 150 235 120 221 104
Polygon -14835848 true false 214 137 206 118 220 104 226 105 220 145 211 131

tree
false
0
Circle -14835848 true false 118 3 94
Rectangle -6459832 true false 120 195 180 300
Circle -14835848 true false 65 21 108
Circle -14835848 true false 116 41 127
Circle -14835848 true false 45 90 120
Circle -14835848 true false 104 74 152

triangle
false
0
Polygon -7500403 true true 53 28 57 249 242 128
Polygon -2674135 true false 131 113 138 102 119 91 101 87 81 89 63 103 57 136 57 161 64 181 80 191 103 191 120 195 149 184 146 156 113 155 113 167 136 166 133 179 106 180 78 170 66 159 67 133 79 108 98 104 117 106 131 111
Polygon -1184463 true false 117 86 124 74 115 71 100 70 84 72 72 76 71 88 72 100 79 112 99 122 114 124 132 155 134 155 125 144 132 155 135 156 142 157 138 138 131 125 115 112 103 105 93 100 87 90 90 82 105 82 118 83 121 83
Polygon -1184463 true false 134 171 108 172 100 169 90 168 90 176 115 180 130 180 136 177 135 171

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

wall 1
true
0
Rectangle -6459832 true false 62 107 221 193
Polygon -1 false false 60 195 227 194 226 106 60 105 60 195

wall 2
true
0
Rectangle -6459832 true false 90 105 210 195
Line -1 false 212 103 90 103
Line -1 false 89 103 89 197
Line -1 false 211 197 89 197
Line -1 false 213 198 213 102

wheel
true
0
Circle -7500403 true true 3 3 294
Circle -13345367 true false 30 30 240
Line -7500403 true 150 285 150 15
Line -7500403 true 15 150 285 150
Circle -7500403 true true 120 120 60
Line -13840069 false 216 40 79 269
Line -13840069 false 40 84 269 221
Line -13840069 false 40 216 269 79
Line -13840069 false 84 40 221 269

wolf
false
0
Polygon -16777216 true false 253 133 245 131 245 133
Polygon -7500403 true true 2 194 13 197 30 191 38 193 38 205 20 226 20 257 27 265 38 266 40 260 31 253 31 230 60 206 68 198 75 209 66 228 65 243 82 261 84 268 100 267 103 261 77 239 79 231 100 207 98 196 119 201 143 202 160 195 166 210 172 213 173 238 167 251 160 248 154 265 169 264 178 247 186 240 198 260 200 271 217 271 219 262 207 258 195 230 192 198 210 184 227 164 242 144 259 145 284 151 277 141 293 140 299 134 297 127 273 119 270 105
Polygon -7500403 true true -1 195 14 180 36 166 40 153 53 140 82 131 134 133 159 126 188 115 227 108 236 102 238 98 268 86 269 92 281 87 269 103 269 113

x
true
0
Polygon -7500403 true true 270 75 225 30 30 225 75 270
Polygon -7500403 true true 30 75 75 30 270 225 225 270
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
